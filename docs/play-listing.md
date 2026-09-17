# BRIDGE PHOTO – Google Play listing pack (Android)

Everything to paste into the Play Console for version 1.0 (versionCode 1), package `app.bridgephoto`. The iPhone version is covered separately in `app-store-checklist.md`.

Placeholders to fill in before pasting:

- `bridgephoto.vwn@gmail.com` – the developer contact email (shown publicly on Google Play).
- `BRIDGE PHOTO` – the public developer name.
- `<PRIVACY POLICY URL>` – the public address of `docs/privacy-policy.html` once it is on GitHub Pages (for example `https://OWNER.github.io/bridgephoto/privacy-policy.html`).
- `https://github.com/OWNER/bridgephoto` – the repository address (placeholder until the repository exists).

Character limits are Google's as of September 2026. The Play Console shows a live counter on every field; if a limit has changed, the Console wins.

---

## 1. Main store listing

### App name (max 30 characters)

<!-- TITLE-START -->
```
BRIDGE PHOTO - PDF Scanner
```
<!-- TITLE-END -->

26 characters. Google's metadata policy does not allow words like "free", "best", "#1" or "sale" in the app name, icon or developer name, so keep them out of the title (they are fine in the descriptions).

### Short description (max 80 characters)

<!-- SHORT-START -->
```
Free scanner. No ads, no account, no internet. Searchable PDF, on-device OCR.
```
<!-- SHORT-END -->

77 characters.

### Full description (max 4,000 characters)

Paste as plain text. Every line below is true for the Android version 1.0; if a feature changes, change the text.

<!-- FULL-START -->
```
BRIDGE PHOTO is a free document scanner with no ads, no account and no internet permission. Open the app, point it at the page, and the scan is captured, cropped and cleaned up on your phone.

PRIVATE BY DESIGN
• No ads, no in-app purchases, no subscriptions.
• No account and no sign-in.
• No analytics or crash-reporting SDKs. No tracking of its own.
• No internet permission. The app cannot send your documents anywhere.
• Scans stay in the app's private storage on your phone. Nothing leaves the phone unless you share or export it.
• Open source under the Apache 2.0 licence, so anyone can check the code.

SCAN
• Multi-page scanning with autofocus, automatic capture, edge detection and corner adjustment.
• Colour, greyscale and black-and-white filters, plus stain and finger removal.
• Import photos from your gallery as pages.
• Add more pages to a document you scanned earlier.

ORGANISE
• Document list with rename, search and delete.
• Reorder, rotate and delete pages.
• Merge scanned documents into one. Merge existing PDF files. Import a PDF as pages.

TEXT RECOGNITION (OCR) ON YOUR PHONE
• Recognises Latin-script text (English and many other languages) and Devanagari (Hindi, Nepali, Marathi).
• Searchable PDFs: the recognised text is embedded as an invisible layer, so you can search the PDF and copy text out of it.
• Copy or share the recognised text on its own.
• Arabic is not supported in this version.

SHARE AND EXPORT
• Export or share as PDF, JPEG or PNG.
• Send to WhatsApp, email or any app on your phone.

MORE
• Dark mode.
• Free, with nothing to unlock.

GOOD TO KNOW
• Works on Android 7.0 and later.
• Scanning and text recognition are done on your phone by Google ML Kit, which is part of Google Play services. The app therefore needs Google Play services; phones without it (for example Huawei phones without GMS) are not supported.
• The first time you scan or use OCR, Google Play services downloads its scanner and text models once. That download is made by Google Play services, not by the app.
• Google's ML Kit may report technical diagnostics to Google (device model, app version, timings). BRIDGE PHOTO itself never receives any data. Details are in the privacy policy.
• Android backup is switched off for this app. Uninstalling it deletes its scans, so export anything you want to keep.

BRIDGE PHOTO is a small contribution to society from an individual developer, built after a well-known free, ad-free scanner app was retired at the end of 2025.
```
<!-- FULL-END -->

About 2,600 characters (the exact count is in the report that accompanied this file; the Console counter is the final word).

### Release notes for 1.0 ("What's new", max 500 characters per language)

<!-- NOTES-START -->
```
First release of BRIDGE PHOTO.
• Scan multi-page documents with automatic capture, edge detection and filters.
• Rename, search, reorder, rotate, merge and import PDFs.
• On-device text recognition (Latin and Devanagari) with searchable PDFs.
• Export or share as PDF, JPEG or PNG.
• No ads, no account, no internet permission. Free and open source.
```
<!-- NOTES-END -->

---

## 2. Store settings

| Field | Answer |
|---|---|
| App or game | App |
| Category | Productivity (Tools is the fallback if you prefer it) |
| Tags (up to 5, chosen from Google's fixed list) | Pick the closest that exist in the Console's list, for example: Productivity, Utilities, Document scanner, PDF, OCR. If a suggested tag is not in the list, skip it; do not invent tags. |
| Store listing contact email (required, public) | `bridgephoto.vwn@gmail.com` |
| Store listing website (optional) | `https://github.com/OWNER/bridgephoto` |
| Store listing phone (optional) | Leave blank |
| External marketing ("Google can advertise your app outside Google Play") | Your choice; it does not change what the app does or collects. |
| Default language | English (United Kingdom) or English (United States) – pick one and keep the spelling consistent |
| Pricing | Free. Once an app is published as free it cannot be changed to paid. |
| Countries / regions | All available countries. |

---

## 3. App content declarations (Play Console → Policy → App content)

Every item below must be completed before a closed-testing or production release can be reviewed. Answer exactly; Google compares these answers with the app itself and with the privacy policy.

### 3.1 Privacy policy

- URL: `<PRIVACY POLICY URL>` (the GitHub Pages copy of `docs/privacy-policy.html`; it covers Android and iOS in one page).
- The page must be public, must not need a login, and must not be a PDF or an editable document.

### 3.2 Ads

- "Does your app contain ads?" → **No.** (No ad SDKs, no promotional content, no cross-promotion.)

### 3.3 App access

- Choose **"All functionality in my app is available without any access restrictions"** (the option that says nothing is behind a login, membership or location).
- There is no login, so no test credentials are needed.

### 3.4 Content rating (IARC questionnaire)

- Email address for the rating certificate: `bridgephoto.vwn@gmail.com`.
- App category: **Utility, Productivity, Communication, or Other.**
- Answer **No** to every content question. The app shows only the user's own documents. In particular:

| Question theme (wording varies) | Answer | Why |
|---|---|---|
| Violence, blood, fear, horror | No | None. |
| Sexual content or nudity | No | None. |
| Profanity or crude humour | No | None. |
| Drugs, alcohol, tobacco references | No | None. |
| Gambling (real or simulated) | No | None. |
| Does the app allow users to interact or exchange content with other users (chat, sharing inside the app)? | No | The app has no user-to-user features. Sharing goes out through Android's share sheet to other apps. If the Console's wording clearly covers sharing to other apps, answer to the letter of the question and confirm in the Play Console. |
| Does the app share the user's location with other users? | No | The app has no location access at all. |
| Does the app allow users to buy digital goods? | No | No in-app purchases. |
| Does the app contain user-generated content that other users can see? | No | Nothing is uploaded anywhere. |
| Is the app a web browser or search engine, or does it contain one? | No | No internet permission. |
| Does the app contain ads? | No | None. |

- Expect the lowest rating tier (for example "Everyone" / PEGI 3). The questionnaire decides; do not edit the result.
- Redo the questionnaire if a future version adds any of the things above.

### 3.5 Target audience and content

- Target age groups: select **18 and over** only. The app is a general-purpose tool that is not designed for children; choosing only 18+ keeps it out of the Families programme, which has extra rules.
- "Could your app unintentionally appeal to children?" (wording varies) → **No.** A plain document scanner with no characters, games or child-directed imagery.
- If the Console asks about ads or in-app purchases here, the answers are No.

### 3.6 News apps

- "Is your app a news app?" → **No.**

### 3.7 COVID-19 contact tracing and status apps

- Select **"My app is not a publicly available COVID-19 contact tracing or status app"**.

### 3.8 Data safety – read this first

BRIDGE PHOTO itself collects nothing and cannot use the internet. But the Android version is built on Google ML Kit, and Google's own [ML Kit Android data disclosure](https://developers.google.com/ml-kit/android-data-disclosure) says (checked 17 September 2026) that the ML Kit SDKs send Google diagnostic and usage data: device manufacturer, model and OS version; the app's package name and version; per-installation identifiers "not intended to uniquely identify a user or physical device"; image format and resolution; input and output sizes; timings and error codes. Google says this is encrypted in transit and not transferred to third parties, and the page tells developers to disclose it in the Data safety section. Google's Data safety rules also say "collect" includes data "transmitted off device from your app by libraries and/or SDKs used in your app". The Document Scanner and Text Recognition APIs are not listed as collecting anything beyond that common set.

So there are two answer sets. **We recommend A**, because it follows Google's written guidance, and the privacy policy already discloses the ML Kit diagnostics. The owner decides. Whichever you choose, the privacy policy stays true, because it says the app itself collects nothing and Google's components may report diagnostics to Google.

(This is an Android-only question. On iOS the scanner and OCR are Apple's own iOS frameworks, so the App Store privacy label is simply "Data Not Collected"; see `app-store-checklist.md`.)

#### Answer set A (recommended): disclose the ML Kit diagnostics

Overview / Data collection and security:

| Question | Answer |
|---|---|
| Does your app collect or share any of the required user data types? | **Yes** |
| Is all of the user data collected by your app encrypted in transit? | **Yes** (Google states ML Kit uses HTTPS) |
| Does your app allow users to create an account? (asked in newer versions of the form) | **No** |
| Do you provide a way for users to request that their data is deleted? | **No** – the developer never receives this data and cannot delete it; it is held by Google under Google's privacy policy. |
| Independent security review (optional) | Skip / No |

Data types (tick only these):

| Category → type | Collected? | Shared? | Processed ephemerally? | Required or optional? | Purpose |
|---|---|---|---|---|---|
| App info and performance → Diagnostics | Yes | No | No | Required (users cannot opt out) | Analytics |
| Device or other IDs → Device or other IDs | Yes | No | No | Required (users cannot opt out) | Analytics |

Do **not** tick Photos and videos, Files and docs, Personal info, Location, Contacts, Messages, Financial info, Health, Calendar, Web browsing, App activity or Audio. Nothing of the sort leaves the device.

The store will then show roughly: "This app may collect these data types: App info and performance, Device or other IDs. Data is encrypted in transit. Data can't be deleted." Check the preview before you submit.

If, after reading Google's page yourself, you think the usage "event types" it lists belong under "App activity → App interactions" as well, add that row with the same answers. Google's page does not map its list to Data safety categories, so this is a judgement call: confirm in the Play Console.

#### Answer set B: "no data collected"

Use only if you conclude, after reading Google's page, that the ML Kit telemetry is Google Play services' own collection and not the app's (the app has no INTERNET permission and cannot transmit anything itself).

| Question | Answer |
|---|---|
| Does your app collect or share any of the required user data types? | **No** |

All other questions then become inactive, and the store shows "No data collected" and "No data shared with third parties".

Risk: if Google's reviewers disagree, you will get a Data safety policy email with a deadline to correct the form. That is fixable, but it is a policy strike you can avoid by choosing A.

### 3.9 Government apps

- "Is your app developed by or on behalf of a government?" → **No.**

### 3.10 Financial features

- Select **"My app doesn't provide any financial features"** (or tick nothing, depending on the wording).

### 3.11 Health apps

- Select **"My app does not have any health features"** (wording varies; confirm in the Play Console).

### 3.12 Advertising ID

- "Does your app use advertising ID?" → **No.** The manifest declares no `com.google.android.gms.permission.AD_ID` permission and no ad or analytics SDK.

### 3.13 Permission declarations

- Photo and video permissions, foreground service, exact alarms, full-screen intent, SMS/call log, accessibility, VPN, package visibility: **none apply.** The built app has no INTERNET permission; its only permission is ACCESS_NETWORK_STATE (added by a Google library, cannot move data). If the Console still shows one of these forms, answer that the app does not use the permission.

### 3.14 Anything else the Console adds

Google adds declarations from time to time. For every new one, the honest answer for this app is "No / none / does not apply", unless the question is about Google Play services or on-device ML, in which case read it carefully and confirm in the Play Console.

---

## 4. Graphic assets Google requires

Sizes below are from Google's "Add preview assets" and icon-design pages, checked 17 September 2026. Confirm in the Play Console upload dialog, which states the current rule next to each slot.

| Asset | Required? | Exact spec | File in this repo |
|---|---|---|---|
| App icon | Yes | 512 × 512 px, 32-bit PNG, sRGB, max 1,024 KB. **Full square: do not round the corners and do not use transparency.** Google Play masks the icon itself (rounded corners at 30% of the icon size) and adds its own shadow. | `docs/icon-512-play.png` (upload this one). `docs/icon-512.png` is the rounded version for the README and GitHub only. |
| Feature graphic | Yes | 1,024 × 500 px, JPEG or 24-bit PNG (no alpha). Keep the wordmark and artwork in the middle; edges may be cropped in some placements. | `docs/feature-graphic.png` (24-bit, no alpha) |
| Phone screenshots | Yes, minimum 2, maximum 8 | JPEG or 24-bit PNG (no alpha). Each side between 320 and 3,840 px. The long side must not be more than twice the short side, so a raw 1,080 × 2,400 phone screenshot is rejected: use 9:16 (1,080 × 1,920 is the safe choice) or 16:9. Google recommends at least 1,080 px on the short side. | To be captured (shot list below) |
| 7-inch tablet screenshots | Optional (up to 8) | Same file rules; Google's large-screen guidance says 1,080 to 7,680 px per side, 16:9 or 9:16, and at least 4 screenshots to qualify for large-screen promotion. | Optional |
| 10-inch tablet screenshots | Optional (up to 8) | As for 7-inch. | Optional |
| Chromebook screenshots | Optional | As for tablets. | Optional |
| Promo video | Optional | A public YouTube URL. | None |

How to get 1,080 × 1,920 screenshots from a modern phone: take the screenshot on the phone (usually 1,080 × 2,400 or similar), then crop the status bar area at the top and the navigation area at the bottom to 1,920 px high, or capture on an Android emulator with a 1,080 × 1,920 display. Use the same phone frame, orientation and theme for all shots.

### Screenshot shot list (6 screens, all real features)

Use dummy documents only: a made-up invoice, a letter, a form with fake names. Never a real customer document, ID or bank paper. Clear notifications, full battery, no personal names on screen.

| # | Screen | What must be visible | Suggested caption (short, no promotional words) |
|---|---|---|---|
| 1 | Document list | Three or four scanned documents with names and dates, the search box, and the scan button. | "All your scans in one list" |
| 2 | Scanning | The scanner screen (Google ML Kit) with a page on a table and the detected edges highlighted, or the corner-adjustment step. | "Automatic edge detection and capture" |
| 3 | Page editing | A multi-page document open, with pages being reordered or rotated, and the "add pages" action visible. | "Reorder, rotate, add pages" |
| 4 | Text recognition | The recognised text of a page that has both English and Nepali (Devanagari) text, with the copy and share actions visible. | "Text recognition on your phone: Latin and Devanagari" |
| 5 | Export and share | The export choice (PDF / JPEG / PNG) and the Android share sheet with WhatsApp and email visible. | "Share as PDF, JPEG or PNG" |
| 6 | Merge and import, in dark mode | The merge screen (two scanned documents becoming one) or "import PDF as pages", captured with dark mode on. | "Merge documents and import PDFs" |

If the Play Console is set to a 9:16 phone slot, all six shots must be portrait. Do not add borders, device frames with third-party logos, or text that claims rankings or prices.

---

## 5. Data safety preview text (what users will see)

- With answer set A: "This app may collect these data types: App info and performance, Device or other IDs. Data is encrypted in transit. Data can't be deleted."
- With answer set B: "No data collected. No data shared with third parties."

Make sure the privacy policy at `<PRIVACY POLICY URL>` is live before you submit either.
