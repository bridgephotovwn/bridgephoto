import Flutter
import UIKit
import CoreImage
import Vision
import VisionKit
import PDFKit
import Photos
import Contacts
import ContactsUI

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
class Engine: NSObject, VNDocumentCameraViewControllerDelegate, CNContactViewControllerDelegate {
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
    case "pageStats":
      bg(result) { try self.pageStats(path: args["path"] as? String ?? "") }
    case "compressImage":
      bg(result) {
        try self.compressImage(input: args["input"] as? String ?? "",
                               output: args["output"] as? String ?? "",
                               maxDim: args["maxDim"] as? Int ?? 2400,
                               quality: args["quality"] as? Int ?? 80,
                               grey: args["grey"] as? Bool ?? false)
      }
    case "encryptPdf":
      bg(result) {
        try self.encryptPdf(input: args["input"] as? String ?? "",
                            output: args["output"] as? String ?? "",
                            password: args["password"] as? String ?? "")
        return true
      }
    case "splitSpread":
      bg(result) {
        try self.splitSpread(input: args["input"] as? String ?? "",
                             outLeft: args["outLeft"] as? String ?? "",
                             outRight: args["outRight"] as? String ?? "",
                             quality: args["quality"] as? Int ?? 92)
      }
    case "redact":
      bg(result) {
        try self.redact(page: args["page"] as? String ?? "",
                        rects: args["rects"] as? [[String: Any]] ?? [],
                        quality: args["quality"] as? Int ?? 92)
        return true
      }
    case "composeSheet":
      bg(result) {
        try self.composeSheet(inputs: args["inputs"] as? [String] ?? [],
                              output: args["output"] as? String ?? "",
                              quality: args["quality"] as? Int ?? 92)
        return true
      }
    case "enhance":
      bg(result) {
        try self.enhance(input: args["input"] as? String ?? "",
                         output: args["output"] as? String ?? "",
                         mode: args["mode"] as? String ?? "auto",
                         quality: args["quality"] as? Int ?? 92)
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
    case "overlay":
      bg(result) {
        try self.overlay(page: args["page"] as? String ?? "",
                         sticker: args["sticker"] as? String ?? "",
                         x: args["x"] as? Int ?? 0, y: args["y"] as? Int ?? 0,
                         w: args["w"] as? Int ?? 0, h: args["h"] as? Int ?? 0)
        return true
      }
    case "addContact":
      addContact(args, result: result)
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

  /// How much ink is on a page, and a fingerprint for comparing pages. The
  /// fingerprint is a difference hash, which survives re-scanning and
  /// exposure changes — which is what makes two photographs of the SAME page
  /// look alike to it.
  private func pageStats(path: String) throws -> [String: Any] {
    guard let ui = UIImage(contentsOfFile: path), let cg = Engine.normalized(ui).cgImage else {
      throw EngineError("Cannot read the page.")
    }
    func grey(_ w: Int, _ h: Int) -> [UInt8] {
      var buf = [UInt8](repeating: 0, count: w * h)
      if let ctx = CGContext(data: &buf, width: w, height: h, bitsPerComponent: 8,
                             bytesPerRow: w, space: CGColorSpaceCreateDeviceGray(),
                             bitmapInfo: CGImageAlphaInfo.none.rawValue) {
        ctx.draw(cg, in: CGRect(x: 0, y: 0, width: w, height: h))
      }
      return buf
    }
    let tiny = grey(9, 8)
    var hash: UInt64 = 0
    var bit = 0
    for y in 0..<8 {
      for x in 0..<8 {
        if tiny[y * 9 + x] > tiny[y * 9 + x + 1] { hash |= (1 << UInt64(bit)) }
        bit += 1
      }
    }
    let w = min(cg.width, 400), h = min(cg.height, 560)
    let lum = grey(w, h)
    let sorted = lum.sorted()
    let paper = Int(sorted[min(Int(Double(sorted.count) * 0.9), sorted.count - 1)])
    let threshold = Int(Double(paper) * 0.72)
    let dark = lum.reduce(0) { $0 + (Int($1) < threshold ? 1 : 0) }
    return ["ink": Double(dark) / Double(lum.count), "hash": String(hash)]
  }

  /// Re-encodes an image smaller: scaled to at most `maxDim` on its longest
  /// side, at JPEG `quality`. Returns the bytes written. The caller drives the
  /// search for a target size.
  private func compressImage(input: String, output: String, maxDim: Int, quality: Int,
                             grey: Bool) throws -> Int {
    guard let ui = UIImage(contentsOfFile: input) else { throw EngineError("Cannot read the image.") }
    var img = Engine.normalized(ui)
    let longest = max(img.size.width, img.size.height)
    if longest > CGFloat(maxDim) {
      let k = CGFloat(maxDim) / longest
      let size = CGSize(width: img.size.width * k, height: img.size.height * k)
      let fmt = UIGraphicsImageRendererFormat.default()
      fmt.scale = 1
      fmt.opaque = true
      img = UIGraphicsImageRenderer(size: size, format: fmt).image { _ in
        img.draw(in: CGRect(origin: .zero, size: size))
      }
    }
    if grey, let cg = img.cgImage {
      // Colour is expensive and a document rarely needs it.
      let ci = CIImage(cgImage: cg)
      if let mono = CIFilter(name: "CIColorControls",
                             parameters: [kCIInputImageKey: ci, kCIInputSaturationKey: 0.0])?.outputImage,
         let out = CIContext().createCGImage(mono, from: mono.extent) {
        img = UIImage(cgImage: out)
      }
    }
    guard let d = img.jpegData(compressionQuality: CGFloat(min(max(quality, 1), 100)) / 100) else {
      throw EngineError("Cannot encode the image.")
    }
    try d.write(to: URL(fileURLWithPath: output), options: .atomic)
    return d.count
  }

  /// Writes a password-protected copy of a PDF. PDFKit does the encryption;
  /// printing and copying stay allowed, because a document you cannot print
  /// is a nuisance dressed as security.
  private func encryptPdf(input: String, output: String, password: String) throws {
    guard !password.isEmpty else { throw EngineError("A password is needed.") }
    guard let doc = PDFDocument(url: URL(fileURLWithPath: input)) else {
      throw EngineError("Cannot read the PDF.")
    }
    let options: [AnyHashable: Any] = [
      PDFDocumentWriteOption.userPasswordOption: password,
      PDFDocumentWriteOption.ownerPasswordOption: password,
    ]
    guard doc.write(to: URL(fileURLWithPath: output), withOptions: options) else {
      throw EngineError("Cannot write the PDF.")
    }
  }

  /// Splits a photograph of an open book into its two pages at the fold.
  /// The fold is the darkest column near the middle - the paper curves away
  /// there and the light never reaches it. Nothing dark enough means no fold,
  /// and then we cut down the exact middle rather than inventing one.
  private func splitSpread(input: String, outLeft: String, outRight: String,
                           quality: Int) throws -> [String: Any] {
    guard let ui = UIImage(contentsOfFile: input) else { throw EngineError("Cannot read the image.") }
    let img = Engine.normalized(ui)
    guard let cg = img.cgImage, cg.width > 1, cg.height > 1 else {
      throw EngineError("This picture is too small to split.")
    }
    let at = Self.gutter(of: cg)
    let cut = min(max(Int(CGFloat(cg.width) * at), 1), cg.width - 1)
    guard let left = cg.cropping(to: CGRect(x: 0, y: 0, width: cut, height: cg.height)),
          let right = cg.cropping(to: CGRect(x: cut, y: 0, width: cg.width - cut, height: cg.height)) else {
      throw EngineError("Cannot split the page.")
    }
    let q = CGFloat(min(max(quality, 1), 100)) / 100
    guard let dl = UIImage(cgImage: left).jpegData(compressionQuality: q),
          let dr = UIImage(cgImage: right).jpegData(compressionQuality: q) else {
      throw EngineError("Cannot encode the pages.")
    }
    try dl.write(to: URL(fileURLWithPath: outLeft), options: .atomic)
    try dr.write(to: URL(fileURLWithPath: outRight), options: .atomic)
    return ["at": Double(at)]
  }

  /// Where the fold is, as a fraction across the page. 0.5 when unsure.
  private static func gutter(of cg: CGImage) -> CGFloat {
    let w = min(cg.width, 800), h = min(cg.height, 200)
    var grey = [UInt8](repeating: 0, count: w * h)
    guard let ctx = CGContext(data: &grey, width: w, height: h, bitsPerComponent: 8,
                              bytesPerRow: w, space: CGColorSpaceCreateDeviceGray(),
                              bitmapInfo: CGImageAlphaInfo.none.rawValue) else { return 0.5 }
    ctx.draw(cg, in: CGRect(x: 0, y: 0, width: w, height: h))

    var column = [Double](repeating: 0, count: w)
    for x in 0..<w {
      var sum = 0.0
      for y in 0..<h { sum += Double(grey[y * w + x]) }
      column[x] = sum / Double(h)
    }
    // Just enough smoothing to kill single-column speckle. Anything wider
    // erases the fold itself, and a shallow fold then goes missing.
    let r = max(1, w / 200)
    var smooth = [Double](repeating: 0, count: w)
    for x in 0..<w {
      let lo = max(0, x - r), hi = min(w - 1, x + r)
      smooth[x] = column[lo...hi].reduce(0, +) / Double(hi - lo + 1)
    }
    let from = Int(Double(w) * 0.30), to = Int(Double(w) * 0.70)
    var bestX = w / 2, best = Double.greatestFiniteMagnitude
    for x in from..<to where smooth[x] < best { best = smooth[x]; bestX = x }
    // A fold is a narrow dark LINE, not a dim area: compare it against the
    // columns a little way to each side. Comparing against the page average
    // cuts a foldless page in the wrong place, because text is broad and dim.
    let d = max(2, Int(Double(w) * 0.06))
    let drop = min(smooth[max(0, bestX - d)], smooth[min(w - 1, bestX + d)]) - best
    if drop < 8 { return 0.5 }
    return CGFloat(bestX) / CGFloat(w)
  }

  /// Paints solid black over parts of a page and rewrites the file. The pixels
  /// themselves go - unlike the black box every other app draws on top of a
  /// PDF, which leaves the words selectable underneath.
  private func redact(page: String, rects: [[String: Any]], quality: Int) throws {
    guard !rects.isEmpty else { throw EngineError("Nothing to cover.") }
    guard let ui = UIImage(contentsOfFile: page) else { throw EngineError("Cannot read the page.") }
    let img = Engine.normalized(ui)
    let fmt = UIGraphicsImageRendererFormat.default()
    fmt.scale = 1
    fmt.opaque = true
    let out = UIGraphicsImageRenderer(size: img.size, format: fmt).image { ctx in
      img.draw(in: CGRect(origin: .zero, size: img.size))
      UIColor.black.setFill()
      for r in rects {
        guard let x = (r["x"] as? NSNumber)?.doubleValue,
              let y = (r["y"] as? NSNumber)?.doubleValue,
              let w = (r["w"] as? NSNumber)?.doubleValue,
              let h = (r["h"] as? NSNumber)?.doubleValue, w > 0, h > 0 else { continue }
        ctx.fill(CGRect(x: x, y: y, width: w, height: h))
      }
    }
    guard let d = out.jpegData(compressionQuality: CGFloat(min(max(quality, 1), 100)) / 100) else {
      throw EngineError("Cannot encode the page.")
    }
    try d.write(to: URL(fileURLWithPath: page), options: .atomic)
  }

  /// Lays several pages onto ONE white A4 sheet, stacked down the page and
  /// each kept in proportion. The front and back of an ID card on a single
  /// sheet is what people want this for, and it is a paid feature everywhere
  /// else. A4 at 300 dpi, because that is what a printer expects.
  private func composeSheet(inputs: [String], output: String, quality: Int) throws {
    guard !inputs.isEmpty else { throw EngineError("Nothing to place on the sheet.") }
    let sheetW: CGFloat = 2480, sheetH: CGFloat = 3508
    let margin = sheetW * 0.05, gap = sheetW * 0.04
    let boxW = sheetW - 2 * margin
    let boxH = (sheetH - 2 * margin - gap * CGFloat(inputs.count - 1)) / CGFloat(inputs.count)

    let fmt = UIGraphicsImageRendererFormat.default()
    fmt.scale = 1
    fmt.opaque = true
    let sheet = UIGraphicsImageRenderer(size: CGSize(width: sheetW, height: sheetH), format: fmt).image { ctx in
      UIColor.white.setFill()
      ctx.fill(CGRect(x: 0, y: 0, width: sheetW, height: sheetH))
      var top = margin
      for path in inputs {
        if let ui = UIImage(contentsOfFile: path) {
          let img = Engine.normalized(ui)
          // Fit inside the slot without stretching: a stretched ID card is a
          // rejected ID card.
          let k = min(boxW / img.size.width, boxH / img.size.height)
          let w = img.size.width * k, h = img.size.height * k
          img.draw(in: CGRect(x: (sheetW - w) / 2, y: top + (boxH - h) / 2, width: w, height: h))
        }
        top += boxH + gap
      }
    }
    guard let d = sheet.jpegData(compressionQuality: CGFloat(min(max(quality, 1), 100)) / 100) else {
      throw EngineError("Cannot encode the sheet.")
    }
    try d.write(to: URL(fileURLWithPath: output), options: .atomic)
  }

  /// Cleans up a page: flattens the shadow and uneven light a phone camera
  /// leaves on paper, then evens the contrast. Core Image does here what
  /// Leptonica does on Android - divide the page by a heavily blurred copy of
  /// itself, which is what "remove the shadow" actually means.
  ///
  /// Straightening is Android-only for now: iOS has no cheap skew measure, and
  /// guessing an angle is worse than leaving the page as it was. The angle
  /// returned is always 0 here, and the caller says nothing about it.
  private func enhance(input: String, output: String, mode: String, quality: Int) throws -> [String: Any] {
    guard let ui = UIImage(contentsOfFile: input) else { throw EngineError("Cannot read the image.") }
    let src = Engine.normalized(ui)
    guard mode != "none" else { return ["angle": 0.0] }
    guard let cg = src.cgImage else { throw EngineError("Cannot read the page.") }
    var image = CIImage(cgImage: cg)

    // The blur has to be wide enough to hold no detail at all - only the
    // lighting. A twentieth of the page is about right at any size.
    let radius = max(8.0, Double(min(cg.width, cg.height)) / 20.0)
    if let blur = CIFilter(name: "CIGaussianBlur",
                           parameters: [kCIInputImageKey: image.clampedToExtent(),
                                        kCIInputRadiusKey: radius])?.outputImage?
        .cropped(to: image.extent),
       let divided = CIFilter(name: "CIDivideBlendMode",
                              parameters: [kCIInputImageKey: blur,
                                           kCIInputBackgroundImageKey: image])?.outputImage {
      image = divided
    }
    let grey = mode != "auto"
    if let controls = CIFilter(name: "CIColorControls",
                               parameters: [kCIInputImageKey: image,
                                            kCIInputSaturationKey: grey ? 0.0 : 1.0,
                                            kCIInputContrastKey: mode == "bw" ? 3.0 : 1.12,
                                            kCIInputBrightnessKey: 0.0])?.outputImage {
      image = controls
    }

    let ctx = CIContext(options: [.useSoftwareRenderer: false])
    guard let out = ctx.createCGImage(image, from: image.extent) else {
      throw EngineError("Cannot write the page.")
    }
    let result = UIImage(cgImage: out)
    guard let d = result.jpegData(compressionQuality: CGFloat(min(max(quality, 1), 100)) / 100) else {
      throw EngineError("Cannot encode the image.")
    }
    try d.write(to: URL(fileURLWithPath: output), options: .atomic)
    return ["angle": 0.0]
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

  /// Draws a transparent PNG (signature, stamp) onto a page and rewrites the JPEG.
  private func overlay(page: String, sticker: String, x: Int, y: Int, w: Int, h: Int) throws {
    guard w > 0, h > 0 else { throw EngineError("Nothing to draw.") }
    guard let base = UIImage(contentsOfFile: page) else { throw EngineError("Cannot read the page.") }
    guard let stk = UIImage(contentsOfFile: sticker) else { throw EngineError("Cannot read the signature.") }
    let src = Engine.normalized(base)
    let fmt = UIGraphicsImageRendererFormat.default()
    fmt.scale = 1
    let out = UIGraphicsImageRenderer(size: src.size, format: fmt).image { _ in
      src.draw(in: CGRect(origin: .zero, size: src.size))
      stk.draw(in: CGRect(x: CGFloat(x), y: CGFloat(y), width: CGFloat(w), height: CGFloat(h)))
    }
    guard let data = out.jpegData(compressionQuality: 0.92) else { throw EngineError("Cannot encode the page.") }
    try data.write(to: URL(fileURLWithPath: page), options: .atomic)
  }

  // MARK: - contacts (the system new-contact form; no Contacts permission needed)

  private func addContact(_ a: [String: Any], result: @escaping FlutterResult) {
    func v(_ k: String) -> String? {
      let s = (a[k] as? String ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
      return s.isEmpty ? nil : s
    }
    let c = CNMutableContact()
    if let name = v("name") {
      let parts = name.split(separator: " ").map(String.init)
      if parts.count > 1 {
        c.givenName = parts.dropLast().joined(separator: " ")
        c.familyName = parts.last ?? ""
      } else {
        c.givenName = name
      }
    }
    c.organizationName = v("company") ?? ""
    c.jobTitle = v("jobTitle") ?? ""
    var phones: [CNLabeledValue<CNPhoneNumber>] = []
    if let m = v("mobile") { phones.append(CNLabeledValue(label: CNLabelPhoneNumberMobile, value: CNPhoneNumber(stringValue: m))) }
    if let p = v("phone") { phones.append(CNLabeledValue(label: CNLabelWork, value: CNPhoneNumber(stringValue: p))) }
    if let f = v("fax") { phones.append(CNLabeledValue(label: CNLabelPhoneNumberWorkFax, value: CNPhoneNumber(stringValue: f))) }
    c.phoneNumbers = phones
    if let e = v("email") { c.emailAddresses = [CNLabeledValue(label: CNLabelWork, value: e as NSString)] }
    if let w = v("website") { c.urlAddresses = [CNLabeledValue(label: CNLabelWork, value: w as NSString)] }
    if v("address") != nil || v("city") != nil || v("country") != nil {
      let pa = CNMutablePostalAddress()
      pa.street = v("address") ?? ""
      pa.city = v("city") ?? ""
      pa.country = v("country") ?? ""
      c.postalAddresses = [CNLabeledValue(label: CNLabelWork, value: pa)]
    }
    if let p = v("photo"), let img = UIImage(contentsOfFile: p) {
      let src = Engine.normalized(img)
      let scale = min(1, 1024 / max(src.size.width, src.size.height))
      let size = CGSize(width: src.size.width * scale, height: src.size.height * scale)
      let fmt = UIGraphicsImageRendererFormat.default()
      fmt.scale = 1
      let small = UIGraphicsImageRenderer(size: size, format: fmt).image { _ in src.draw(in: CGRect(origin: .zero, size: size)) }
      c.imageData = small.jpegData(compressionQuality: 0.85)
    }
    guard let host = presenter else {
      result(FlutterError(code: "contacts", message: "No window to show the contact form in.", details: nil))
      return
    }
    let vc = CNContactViewController(forNewContact: c)
    vc.delegate = self
    let nav = UINavigationController(rootViewController: vc)
    host.present(nav, animated: true)
    result(true)
  }

  func contactViewController(_ viewController: CNContactViewController, didCompleteWith contact: CNContact?) {
    viewController.dismiss(animated: true)
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
