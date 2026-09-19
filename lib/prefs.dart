import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// User settings. Everything is stored locally with SharedPreferences.
class Prefs {
  static late SharedPreferences _p;

  /// Drives MaterialApp.themeMode so a change applies at once.
  static final ValueNotifier<ThemeMode> themeMode =
      ValueNotifier<ThemeMode>(ThemeMode.system);

  static Future<void> init() async {
    _p = await SharedPreferences.getInstance();
    themeMode.value = _themeFromString(theme);
  }

  // Scanner
  /// full = filters + stain/finger clean-up, filter = filters only, base = crop/rotate only.
  /// Android only; iOS uses the system document camera.
  static String get scannerMode => _p.getString('scanner_mode') ?? 'full';
  static set scannerMode(String v) => _p.setString('scanner_mode', v);

  /// Android only: allow importing pictures from the gallery inside the scanner.
  static bool get galleryImport => _p.getBool('gallery_import') ?? true;
  static set galleryImport(bool v) => _p.setBool('gallery_import', v);

  static int get pageLimit => _p.getInt('page_limit') ?? 50;
  static set pageLimit(int v) => _p.setInt('page_limit', v);

  // PDF
  /// a4, letter or fit (page takes the shape of the image).
  static String get pdfSize => _p.getString('pdf_size') ?? 'a4';
  static set pdfSize(String v) => _p.setString('pdf_size', v);

  /// Add the invisible OCR text layer so the PDF is searchable.
  /// Number every page of an exported PDF, bottom centre. Off by default:
  /// a numbered page is right for a report and wrong for a single receipt.
  static bool get pdfPageNumbers => _p.getBool('pdf_page_numbers') ?? false;
  static set pdfPageNumbers(bool v) => _p.setBool('pdf_page_numbers', v);

  /// Text stamped across every page of an exported PDF — "COPY", a company
  /// name, "FOR BANK USE ONLY". Empty means no stamp.
  static String get pdfStamp => _p.getString('pdf_stamp') ?? '';
  static set pdfStamp(String v) => _p.setString('pdf_stamp', v);

  static bool get pdfOcr => _p.getBool('pdf_ocr') ?? true;
  static set pdfOcr(bool v) => _p.setBool('pdf_ocr', v);

  // OCR
  /// latin or devanagari. Android only; iOS detects the language itself.
  static String get ocrScript => _p.getString('ocr_script') ?? 'latin';
  static set ocrScript(String v) => _p.setString('ocr_script', v);

  /// The value actually sent to the engine.
  static String get ocrScriptForEngine => Platform.isAndroid ? ocrScript : 'auto';

  /// best = full-resolution image (default), fast = 2400 px copy.
  static String get ocrQuality => _p.getString('ocr_quality') ?? 'best';
  static set ocrQuality(String v) => _p.setString('ocr_quality', v);

  static int get ocrMaxDim => ocrQuality == 'fast' ? 2400 : 4096;

  // Appearance
  static String get theme => _p.getString('theme') ?? 'system';
  static set theme(String v) {
    _p.setString('theme', v);
    themeMode.value = _themeFromString(v);
  }

  static ThemeMode _themeFromString(String v) => switch (v) {
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.system,
      };
}
