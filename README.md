# BRIDGE PHOTO

A free, open-source document scanner for Android and iPhone. No ads, no account, no tracking.

- Package / bundle ID: `app.bridgephoto` · Version 1.1.0 (build 2)
- Licence: Apache License 2.0
- Source: https://github.com/bridgephotovwn/bridgephoto
- Privacy policy: [`docs/privacy-policy.html`](docs/privacy-policy.html), published at `https://bridgephotovwn.github.io/bridgephoto/privacy-policy.html`
- Runs on Android 7.0 (API 24) and later with Google Play services, and on iOS 15 and later.

## The privacy promise

- No ads, no in-app purchases, no account, no sign-in.
- No analytics, no crash-reporting SDKs, no tracking of any kind in the app.
- The app never connects to the internet. On Android the app has **no `INTERNET` permission**, so it cannot send or receive data. The only permission in the built app is `ACCESS_NETWORK_STATE`, pulled in by a Google library; it lets an app ask whether the phone is online and cannot move data. Android will not ask you to grant anything at install. On iOS the app asks the system for the camera only when the scanner opens (Apple's `NSCameraUsageDescription` prompt) and for add-only Photos access only if you choose "Save to Photos".
- Scans live in the app's private storage on the phone. Nothing leaves the phone unless you share or export it.
- Android backup is switched off, so uninstalling deletes the scans. Export what you want to keep.
- Scanning and text recognition run on the device: Google ML Kit through Google Play services on Android, Apple's VisionKit and Vision frameworks on iOS. Google Play services downloads the Android scanner and OCR models once; that traffic is Google's, not the app's, and Google's ML Kit publishes its own [data disclosure](https://developers.google.com/ml-kit/android-data-disclosure). The privacy policy explains all of this in plain English.
- Open source, so anyone can verify all of the above.

## Languages

The app speaks 46 languages and follows the phone's language automatically (right-to-left included): Amharic, Arabic, Bengali, Chinese (Simplified), Chinese (Traditional), Czech, Danish, Dutch, English, Filipino, Finnish, French, German, Greek, Gujarati, Hebrew, Hindi, Hungarian, Indonesian, Italian, Japanese, Kannada, Korean, Malay, Malayalam, Marathi, Nepali, Norwegian, Persian, Polish, Portuguese, Portuguese (Brazil), Punjabi, Romanian, Russian, Sinhala, Spanish, Swahili, Swedish, Tamil, Telugu, Thai, Turkish, Ukrainian, Urdu, Vietnamese.

## Features (version 1.1)

| Feature | Android | iOS |
|---|---|---|
| Scanner | Google ML Kit Document Scanner: autofocus, automatic capture, edge detection, corner adjustment, colour / greyscale / black-and-white filters, stain and finger removal, multi-page, import from gallery | Apple VisionKit document camera: autofocus, automatic capture, edge detection, perspective correction, colour / greyscale / black-and-white |
| Text recognition (OCR), on the device | Google ML Kit Text Recognition: Latin (English and other Latin-script languages), Devanagari (Hindi, Nepali, Marathi), Chinese, Japanese and Korean. Arabic is read by Tesseract, which is bundled in the app because Google has no Arabic model; on that setting the page is read by both and the two readings are merged, so a bilingual page comes out whole. | Apple Vision: the languages your iOS version supports; English on every version. Hindi, Nepali and Arabic OCR are Android-only. |
| Searchable PDF (invisible OCR text layer, so the PDF can be searched and text copied) | Yes | Yes |
| Copy or share the recognised text | Yes | Yes |
| Document list with rename, search, delete | Yes | Yes |
| Page tools: reorder, rotate, delete; add pages to an existing document | Yes | Yes |
| Merge scanned documents; merge existing PDF files; import a PDF as pages | Yes (PDFBox-Android) | Yes (Apple PDFKit) |
| Export or share as PDF, JPEG or PNG; share to WhatsApp, email or any app | Yes | Yes |
| Business cards: scan a card and save it as a phone contact (review form, then the system Contacts app; no contacts permission) | Yes | Yes |
| Save to Photos | Yes (Android 10 and later, no permission needed) | Yes (add-only Photos access) |
| Dark mode | Yes | Yes |

PDF creation is done in Dart with the `pdf` package on both platforms.

## Why

Free scanner apps without ads have become rare. Microsoft Lens, the best-known one, was retired at the end of 2025. BRIDGE PHOTO is a small contribution to society from an individual developer: a scanner that stays free, stays honest about data, and can be checked by anyone because the code is open.

## How it is built

One Flutter codebase with a small native engine per platform:

- **Android:** Google ML Kit Document Scanner and ML Kit Text Recognition (Latin, Devanagari, Chinese, Japanese, Korean) through Google Play services; Tesseract (Apache-2.0, `android/app/libs`, with the `ara` language pack in `assets/tessdata`) for Arabic; PDF merge and import with PDFBox-Android. Nothing here reaches the network - the app holds no INTERNET permission.
- **iOS:** Apple VisionKit (`VNDocumentCameraViewController`) for the document camera and the Vision framework for on-device OCR; PDF merge and import with Apple PDFKit.
- **Both:** PDF creation in Dart (`pdf` package).

## Build

Requirements: Flutter (stable channel), JDK 17 and Android SDK 36 for Android. iOS builds need Xcode on macOS.

```sh
git clone https://github.com/bridgephotovwn/bridgephoto.git
cd bridgephoto
flutter pub get
flutter build apk           # debug/release APK for sideloading on a phone with Google Play services
flutter build appbundle     # the .aab for Google Play (needs the maintainer's upload key; not in the repository)
```

iOS: `flutter build ipa` on a Mac with Xcode, or use the repository's GitHub Actions workflow, which builds and uploads the iOS app on a macOS runner (free for public repositories). The App Store Connect API key it needs lives in GitHub repository secrets, never in the repository; see [`docs/app-store-checklist.md`](docs/app-store-checklist.md).

Minimum versions: Android 7.0 (API 24), iOS 15.

## Publishing

Everything the owner needs is in `docs/`:

- [`docs/play-listing.md`](docs/play-listing.md) – Google Play title, descriptions, declarations, Data safety answers, asset specs and a screenshot shot list.
- [`docs/play-console-checklist.md`](docs/play-console-checklist.md) – step by step from a new personal Google Play developer account to a public release, including the closed-testing rule.
- [`docs/app-store-checklist.md`](docs/app-store-checklist.md) – step by step to the Apple App Store from Windows with no Mac: enrolment, App Store Connect, the API key for GitHub Actions, TestFlight, the privacy label, screenshots and review.
- [`docs/privacy-policy.html`](docs/privacy-policy.html) – one privacy policy for both platforms, ready to publish on GitHub Pages as-is.
- `docs/icon-512-play.png` (Google Play icon, full square), `docs/icon-512.png` (rounded, for GitHub), `docs/feature-graphic.png`, and the SVG sources.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). The short version: bug reports and pull requests are welcome, and the privacy promise above is not negotiable. Changes are listed in [CHANGELOG.md](CHANGELOG.md).

## Licence

Copyright 2026 `BRIDGE PHOTO`. Licensed under the Apache License, Version 2.0; see [LICENSE](LICENSE).

## Placeholders to fill in

- `https://github.com/bridgephotovwn/bridgephoto` – the real repository address (here, in `docs/`, in `CONTRIBUTING.md` and in the privacy policy).
- `https://bridgephotovwn.github.io/bridgephoto/privacy-policy.html` – the GitHub Pages address of the privacy policy.
- `BRIDGE PHOTO` and `bridgephoto.vwn@gmail.com` – in `LICENSE`, `docs/privacy-policy.html`, `docs/play-listing.md`, `docs/app-store-checklist.md` and `CONTRIBUTING.md`.

Google Play, Google Play services and ML Kit are trademarks of Google LLC. Apple, iPhone, App Store and TestFlight are trademarks of Apple Inc. BRIDGE PHOTO is not affiliated with or endorsed by Google, Apple or Microsoft.
