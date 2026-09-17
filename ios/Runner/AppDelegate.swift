import Flutter
import UIKit
import Vision
import VisionKit
import PDFKit
import Photos

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  private var engine: Engine?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // UIScene lifecycle (Flutter 3.47 template): the engine and the window are
  // created after didFinishLaunching, so channels are registered here.
  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    let channel = FlutterMethodChannel(
      name: "bridgephoto/engine",
      binaryMessenger: engineBridge.applicationRegistrar.messenger())
    let e = Engine()
    engine = e
    channel.setMethodCallHandler { [weak e] call, result in
      e?.handle(call, result: result)
    }
  }
}

struct EngineError: LocalizedError {
  let msg: String
  init(_ m: String) { msg = m }
  var errorDescription: String? { msg }
}

/// The native engine behind the "bridgephoto/engine" channel.
///  - scan:          VisionKit document camera (autofocus, auto-capture, edges, filters)
///  - ocr:           Vision text recognition, on device
///  - mergePdf:      PDFKit, lossless
///  - renderPdf:     PDFKit -> JPEG pages
///  - transform:     rotate / re-encode an image
///  - saveToGallery: Photos (add-only permission)
class Engine: NSObject, VNDocumentCameraViewControllerDelegate {
  private var pendingScan: FlutterResult?

  /// The view controller that can present the scanner right now.
  private var presenter: UIViewController? {
    let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
    let scene = scenes.first { $0.activationState == .foregroundActive } ?? scenes.first
    var vc = scene?.keyWindow?.rootViewController
    while let p = vc?.presentedViewController { vc = p }
    return vc
  }

  func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let args = call.arguments as? [String: Any] ?? [:]
    switch call.method {
    case "scan":
      scan(result: result)
    case "takePendingScan":
      result([String]()) // Android-only recovery path
    case "warmUp":
      result(false) // Android-only: nothing to pre-download on iOS
    case "takeCrashLog":
      result(Engine.takeCrashLog())
    case "logError":
      Engine.appendCrashLog(args["text"] as? String ?? "")
      result(true)
    case "ocr":
      bg(result) { try self.ocr(path: args["path"] as? String ?? "") }
    case "mergePdf":
      bg(result) {
        try self.mergePdf(inputs: args["inputs"] as? [String] ?? [],
                          output: args["output"] as? String ?? "")
        return true
      }
    case "renderPdf":
      bg(result) {
        try self.renderPdf(input: args["input"] as? String ?? "",
                           outDir: args["outDir"] as? String ?? "",
                           maxDim: args["maxDim"] as? Int ?? 2200)
      }
    case "transform":
      bg(result) {
        try self.transform(input: args["input"] as? String ?? "",
                           output: args["output"] as? String ?? "",
                           rotate: args["rotate"] as? Int ?? 0,
                           format: args["format"] as? String ?? "jpg",
                           quality: args["quality"] as? Int ?? 92)
        return true
      }
    case "saveToGallery":
      saveToGallery(path: args["path"] as? String ?? "", result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func bg(_ result: @escaping FlutterResult, _ work: @escaping () throws -> Any?) {
    DispatchQueue.global(qos: .userInitiated).async {
      do {
        let v = try work()
        DispatchQueue.main.async { result(v) }
      } catch {
        DispatchQueue.main.async {
          result(FlutterError(code: "engine", message: error.localizedDescription, details: nil))
        }
      }
    }
  }

  // MARK: - scan

  private func scan(result: @escaping FlutterResult) {
    guard VNDocumentCameraViewController.isSupported else {
      result(FlutterError(code: "scanner", message: "The document camera is not supported on this device.", details: nil))
      return
    }
    guard pendingScan == nil else {
      result(FlutterError(code: "busy", message: "The scanner is already open.", details: nil))
      return
    }
    guard let c = presenter else {
      result(FlutterError(code: "scanner", message: "No window to show the scanner in.", details: nil))
      return
    }
    pendingScan = result
    let vc = VNDocumentCameraViewController()
    vc.delegate = self
    c.present(vc, animated: true)
  }

  func documentCameraViewController(_ controller: VNDocumentCameraViewController,
                                    didFinishWith scan: VNDocumentCameraScan) {
    controller.dismiss(animated: true)
    let res = pendingScan
    pendingScan = nil
    DispatchQueue.global(qos: .userInitiated).async {
      var paths: [String] = []
      let dir = FileManager.default.temporaryDirectory.appendingPathComponent("scan", isDirectory: true)
      try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
      let stamp = Int(Date().timeIntervalSince1970 * 1000)
      for i in 0..<scan.pageCount {
        let img = Engine.normalized(scan.imageOfPage(at: i))
        if let data = img.jpegData(compressionQuality: 0.92) {
          let url = dir.appendingPathComponent("scan_\(stamp)_\(i).jpg")
          if (try? data.write(to: url)) != nil { paths.append(url.path) }
        }
      }
      DispatchQueue.main.async { res?(paths) }
    }
  }

  func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
    controller.dismiss(animated: true)
    let res = pendingScan
    pendingScan = nil
    res?([String]())
  }

  func documentCameraViewController(_ controller: VNDocumentCameraViewController,
                                    didFailWithError error: Error) {
    controller.dismiss(animated: true)
    let res = pendingScan
    pendingScan = nil
    res?(FlutterError(code: "scanner", message: error.localizedDescription, details: nil))
  }

  // MARK: - ocr

  private func ocr(path: String) throws -> [String: Any] {
    guard let ui = UIImage(contentsOfFile: path), let cg = Engine.normalized(ui).cgImage else {
      throw EngineError("Cannot read the image.")
    }
    let w = cg.width
    let h = cg.height
    let req = VNRecognizeTextRequest()
    req.recognitionLevel = .accurate
    req.usesLanguageCorrection = true
    if #available(iOS 16.0, *) {
      req.automaticallyDetectsLanguage = true
    }
    let handler = VNImageRequestHandler(cgImage: cg, orientation: .up, options: [:])
    try handler.perform([req])
    var lines: [[String: Any]] = []
    for obs in req.results ?? [] {
      guard let cand = obs.topCandidates(1).first else { continue }
      let bb = obs.boundingBox // normalised, origin bottom-left
      let l = Int(bb.minX * CGFloat(w))
      let r = Int(bb.maxX * CGFloat(w))
      let t = Int((1 - bb.maxY) * CGFloat(h))
      let b = Int((1 - bb.minY) * CGFloat(h))
      lines.append(["text": cand.string, "l": l, "t": t, "r": r, "b": b])
    }
    return ["w": w, "h": h, "lines": lines]
  }

  // MARK: - pdf

  private func mergePdf(inputs: [String], output: String) throws {
    let out = PDFDocument()
    var idx = 0
    for p in inputs {
      guard let d = PDFDocument(url: URL(fileURLWithPath: p)) else {
        throw EngineError("Cannot open \(URL(fileURLWithPath: p).lastPathComponent).")
      }
      if d.isLocked { throw EngineError("A PDF is password protected.") }
      for i in 0..<d.pageCount {
        if let pg = d.page(at: i) {
          out.insert(pg, at: idx)
          idx += 1
        }
      }
    }
    guard out.write(to: URL(fileURLWithPath: output)) else {
      throw EngineError("Cannot write the PDF.")
    }
  }

  private func renderPdf(input: String, outDir: String, maxDim: Int) throws -> [String] {
    guard let d = PDFDocument(url: URL(fileURLWithPath: input)) else {
      throw EngineError("Cannot open the PDF.")
    }
    if d.isLocked { throw EngineError("The PDF is password protected.") }
    try FileManager.default.createDirectory(atPath: outDir, withIntermediateDirectories: true)
    var out: [String] = []
    let stamp = Int(Date().timeIntervalSince1970 * 1000)
    let fmt = UIGraphicsImageRendererFormat.default()
    fmt.scale = 1
    for i in 0..<d.pageCount {
      guard let pg = d.page(at: i) else { continue }
      let box = pg.bounds(for: .mediaBox)
      // thumbnail(of:for:) applies the page's /Rotate, so swap for 90/270.
      let turned = (((pg.rotation % 360) + 360) % 360) % 180 != 0
      let bw = turned ? box.height : box.width
      let bh = turned ? box.width : box.height
      let longest = max(bw, bh)
      let scale = min(max(CGFloat(maxDim) / max(longest, 1), 0.5), 4)
      let size = CGSize(width: max(1, bw * scale), height: max(1, bh * scale))
      let thumb = pg.thumbnail(of: size, for: .mediaBox)
      let img = UIGraphicsImageRenderer(size: size, format: fmt).image { ctx in
        UIColor.white.setFill()
        ctx.fill(CGRect(origin: .zero, size: size))
        thumb.draw(in: CGRect(origin: .zero, size: size))
      }
      guard let data = img.jpegData(compressionQuality: 0.9) else { continue }
      let url = URL(fileURLWithPath: outDir).appendingPathComponent("pdf_\(stamp)_\(i).jpg")
      try data.write(to: url)
      out.append(url.path)
    }
    return out
  }

  // MARK: - crash log (Dart-side errors; the user decides whether to share it)

  private static var crashFile: URL {
    let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    return dir.appendingPathComponent("crash.txt")
  }

  static func appendCrashLog(_ text: String) {
    let f = crashFile
    var existing = (try? String(contentsOf: f, encoding: .utf8)) ?? ""
    if existing.utf8.count > 200_000 { existing = "" }
    let entry = "=== \(Date())  BRIDGE PHOTO iOS \(UIDevice.current.systemVersion)\n\(text)\n\n"
    try? (existing + entry).write(to: f, atomically: true, encoding: .utf8)
  }

  static func takeCrashLog() -> String? {
    let f = crashFile
    guard let s = try? String(contentsOf: f, encoding: .utf8) else { return nil }
    try? FileManager.default.removeItem(at: f)
    return s
  }

  // MARK: - image

  /// Bakes the EXIF orientation into the pixels so every consumer sees an upright image.
  static func normalized(_ img: UIImage) -> UIImage {
    if img.imageOrientation == .up && img.scale == 1 { return img }
    let fmt = UIGraphicsImageRendererFormat.default()
    fmt.scale = 1
    return UIGraphicsImageRenderer(size: img.size, format: fmt).image { _ in
      img.draw(in: CGRect(origin: .zero, size: img.size))
    }
  }

  private func transform(input: String, output: String, rotate: Int, format: String, quality: Int) throws {
    guard let ui = UIImage(contentsOfFile: input) else { throw EngineError("Cannot read the image.") }
    let src = Engine.normalized(ui)
    let deg = ((rotate % 360) + 360) % 360
    var result = src
    if deg != 0 {
      let radians = CGFloat(deg) * .pi / 180
      let swap = deg == 90 || deg == 270
      let newSize = swap ? CGSize(width: src.size.height, height: src.size.width) : src.size
      let fmt = UIGraphicsImageRendererFormat.default()
      fmt.scale = 1
      result = UIGraphicsImageRenderer(size: newSize, format: fmt).image { ctx in
        let c = ctx.cgContext
        c.translateBy(x: newSize.width / 2, y: newSize.height / 2)
        c.rotate(by: radians)
        src.draw(in: CGRect(x: -src.size.width / 2, y: -src.size.height / 2,
                            width: src.size.width, height: src.size.height))
      }
    }
    let data = format == "png"
      ? result.pngData()
      : result.jpegData(compressionQuality: CGFloat(min(max(quality, 1), 100)) / 100)
    guard let d = data else { throw EngineError("Cannot encode the image.") }
    try d.write(to: URL(fileURLWithPath: output), options: .atomic)
  }

  private func saveToGallery(path: String, result: @escaping FlutterResult) {
    let save: () -> Void = {
      PHPhotoLibrary.shared().performChanges({
        PHAssetChangeRequest.creationRequestForAssetFromImage(atFileURL: URL(fileURLWithPath: path))
      }) { ok, err in
        DispatchQueue.main.async {
          if let e = err {
            result(FlutterError(code: "gallery", message: e.localizedDescription, details: nil))
          } else {
            result(ok)
          }
        }
      }
    }
    PHPhotoLibrary.requestAuthorization(for: .addOnly) { status in
      if status == .authorized || status == .limited {
        save()
      } else {
        DispatchQueue.main.async { result(false) }
      }
    }
  }
}
