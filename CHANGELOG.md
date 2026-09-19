# Changelog

## 1.2.0 (unreleased)

- Arabic text recognition. Google's models cannot read Arabic, so an Arabic page is read by Tesseract instead, bundled in the app. Choose it under Settings > Text recognition > Language, or from the menu on the text screen. The page is read twice on that setting - Google for the Latin half, Tesseract for the Arabic - because UAE paperwork is nearly always bilingual, and the two readings are merged. Arabic also reaches the searchable PDF text layer.
- Find blank and repeated pages. The empty back of a sheet, or the page you photographed twice — it shows you what it found with a thumbnail of each, everything ticked, and removes only what you leave ticked. The open-source world has had a request for this open since 2015 and no phone app does it.
- Text from a page in columns now reads in the right order. Recognition hands lines back top to bottom, which turns two columns into interleaved nonsense — a newspaper, a contract with two languages side by side, a form with two panels. The app now finds the gap between the columns and reads each one fully before the next, with headings that span the page keeping their place above them. Arabic pages read their columns right to left. Blind users reported this more than any other fault, because a reader speaks the jumble aloud and there is no way to tell it is jumbled. It improves the text screen, search, the searchable PDF and the automatic name all at once.
- Save a PDF under a size limit. Portals reject anything over a fixed number of kilobytes and offer no help — India's exam portal wants under 300 KB, the UAE's ICP 2 MB, the labour ministry 500 KB, Nepal's passport service 1 MB. Pick the limit and the app shrinks a copy until it fits, giving up resolution before it ruins quality. **Your scans are never touched.** If it genuinely cannot fit, it says so and tells you the smallest it managed, instead of handing back something unreadable and calling it done.
- Folders. Pick documents and move them into a folder — an existing one or a new one you name there and then. Folders are made of the documents in them, so there is nothing to create and nothing to tidy up: the last document to leave takes the folder with it. **Search always looks everywhere**, because having to remember which folder you filed something in is the thing search is supposed to spare you. Nobody who never files anything ever sees a folder. This was the most-asked-for missing feature across every scanner app we looked at — 42 people.
- Fixed: Arabic text in the searchable PDF came out backwards when copied or searched. The page always looked right; the invisible layer underneath was laid out the other way, so anything reading it got the line in reverse — the same fault that has left Tesseract's own Arabic PDFs unsearchable since 2016.
- Scans name themselves from what is written on the page: the date, the kind of document and its number — `2026-09-19 Invoice INV-4471`. The date comes first so documents sort by themselves, and the date printed on the paper wins over the day you scanned it. With no number, the issuer's name is used instead, found as the biggest line at the top of the page. It only ever names a scan still called "Scan …", so a name you chose is never changed, and a page that says nothing useful keeps its plain name. Settings > PDF.
- Save a PDF with a password. AES-256 — the strongest encryption a PDF can carry, and a real open password rather than the "please don't print this" flag that any free tool strips in seconds. Printing and copying stay allowed. Ten of the apps we looked at charge for this; the library was already in the app for merging.
- Number the pages, and stamp words across every exported page — COPY, a company name, FOR BANK USE ONLY. The stamp runs corner to corner like a rubber stamp and is drawn faint, so the document underneath stays readable. Both in Settings > PDF, both off by default.
- Book mode: one photograph of an open book becomes two pages, cut at the fold. The fold is found by looking for the narrow dark line where the paper curves away from the light; when there is no fold to find, the page is cut down the middle rather than somewhere invented. You choose which side comes first, because an Arabic or Urdu book reads the other way round. Paid-only in every app that offers it.
- Cover for good: drag over anything that must not be readable and it is removed from the picture itself. Most apps draw a black box over a PDF and leave the words selectable underneath — people have been embarrassed in court by exactly that. Here the pixels go, the recognised text is thrown away, and the original scan of that page is deleted, because a hidden copy of what you just hid is a leak. It cannot be undone, and the app says so before doing it.
- Pages on one sheet: an ID card, a licence, a passport and its visa — front and back on one printable A4 sheet at 300 dpi, each kept in proportion. The pages you picked are kept.
- Clean up the page: a new button on any page takes out the shadow and uneven light a phone camera leaves on paper, evens the contrast, and straightens a page photographed crooked. Auto keeps the colour; there are also greyscale and black-and-white for text. The scan as it came off the camera is kept, so "Original scan" always puts it back. **This works on photos brought in from the gallery and on pages imported from a PDF** - Google's scanner only cleans up inside its own camera screen, so until now those got nothing. It adds NOTHING to the app's size: the image library came in with Arabic.
- The business card screen keeps the tick for sending the card photo to the contact (added late in 1.1.0).
- Two editions are built from this codebase: the public BRIDGE PHOTO, which has no internet permission and never will, and a separate company edition with its own app id which is the only one allowed near the network. The public build now reads its own finished manifest and REFUSES TO BUILD if the internet permission is in it, so that promise cannot be broken by accident or by a library. Build with `--flavor free` (store) or `--flavor business`.

## 1.1.0 (2026-09-18)

- Business cards: scan a card, review the fields, and hand it to the phone's Contacts app already filled in (name, company, title, numbers, email, website, address, card photo). No contacts permission.
- Sign: draw and save signatures, place them on any page (drag, pinch), baked into the page image.
- The app speaks 46 languages and follows the phone's language automatically (right-to-left included): Amharic, Arabic, Bengali, Chinese (Simplified), Chinese (Traditional), Czech, Danish, Dutch, English, Filipino, Finnish, French, German, Greek, Gujarati, Hebrew, Hindi, Hungarian, Indonesian, Italian, Japanese, Kannada, Korean, Malay, Malayalam, Marathi, Nepali, Norwegian, Persian, Polish, Portuguese, Portuguese (Brazil), Punjabi, Romanian, Russian, Sinhala, Spanish, Swahili, Swedish, Tamil, Telugu, Thai, Turkish, Ukrainian, Urdu, Vietnamese.
- Android text recognition adds Chinese, Japanese and Korean (each also reads Latin); OCR runs at full resolution (Settings > Text recognition > Quality).
- Search reads the words inside every scanned page, not just the document names, and shows the matching line.
- Scanner start shows a "Preparing" state on first use; a scan that finishes after the app was recreated is recovered.
- Private on-device crash recorder, offered for sharing after a crash.
- Business cards read more carefully: a card whose e-mail names the person no longer puts that person in the company field; numbers survive a zero read as a round shape; and digits in any script (Devanagari, Bengali, Arabic-Indic and the rest) are stored as plain digits, which a card read with the Devanagari model needs.

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
- Android: no `INTERNET` permission (stripped from the merged manifest); the only permission is `ACCESS_NETWORK_STATE` from a Google library; Android backup switched off.
- iOS: camera prompt only when the scanner opens; add-only Photos prompt only for "Save to Photos".
- Scans are stored in the app's private storage on the phone.

### Known limitations

- Android needs Google Play services (the scanner and OCR models are provided and downloaded by it). Minimum Android 7.0 (API 24).
- Minimum iOS 15.
- Arabic text recognition is not included. Hindi and Nepali recognition are Android-only in this version.
- Uninstalling the app deletes its scans; export anything you want to keep first.
