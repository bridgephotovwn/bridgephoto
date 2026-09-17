# Changelog

All notable changes to BRIDGE PHOTO are recorded here. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). The stores see the platform version fields (Android versionName 1.0 / versionCode 1; iOS version 1.0 / build 1); this file uses the three-part form of the same number.

## [Unreleased]

## [1.0.0] - 2026-09-17

First public release for Android and iOS. Package / bundle ID `app.bridgephoto`, version 1.0, build 1.

### Added

- Multi-page scanning. Android: Google ML Kit document scanner (on-device, via Google Play services) with autofocus, automatic capture, edge detection, corner adjustment, colour / greyscale / black-and-white filters, stain and finger removal, and import from the gallery. iOS: Apple VisionKit document camera with autofocus, automatic capture, edge detection, perspective correction, and colour / greyscale / black-and-white output.
- Document list with rename, search and delete.
- Page tools: reorder, rotate, delete; add pages to an existing document.
- Export and share as PDF, JPEG or PNG; share to WhatsApp, email or any app. On iOS, "Save to Photos" (add-only Photos access).
- Searchable PDF export with an invisible OCR text layer, so the PDF can be searched and its text copied.
- On-device text recognition. Android: Google ML Kit Text Recognition, Latin script (English and other Latin-script languages) and Devanagari (Hindi, Nepali, Marathi). iOS: Apple Vision, the languages the installed iOS version supports; English on every version.
- Copy or share the recognised text.
- Merge scanned documents into one; merge existing PDF files; import a PDF as pages (PDFBox-Android on Android, Apple PDFKit on iOS).
- Dark mode.
- One Flutter codebase; PDF creation in Dart (`pdf` package).

### Privacy

- No account, no ads, no in-app purchases, no analytics, no crash reporting, no tracking; the app never connects to the internet.
- Android: no permissions declared in the manifest, not even `INTERNET`; Android backup switched off.
- iOS: camera prompt only when the scanner opens; add-only Photos prompt only for "Save to Photos".
- Scans are stored in the app's private storage on the phone.

### Known limitations

- Android needs Google Play services (the scanner and OCR models are provided and downloaded by it). Minimum Android 7.0 (API 24).
- Minimum iOS 15.
- Arabic text recognition is not included. Hindi and Nepali recognition are Android-only in this version.
- Uninstalling the app deletes its scans; export anything you want to keep first.
