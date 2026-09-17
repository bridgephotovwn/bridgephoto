# BRIDGE PHOTO – publishing on the Apple App Store from Windows, with no Mac

A step-by-step checklist for the owner. It assumes: a Windows PC and no Mac; an **individual** Apple Developer Program membership; the iOS app (bundle ID `app.bridgephoto`, version 1.0, build 1) is built and uploaded by the GitHub Actions workflow in the repository, which runs on a macOS runner that GitHub hosts; and at least one iPhone to test with (borrow one if needed – the iOS Simulator only exists on a Mac).

Fees, sizes and timings were checked on 17 September 2026. Apple changes them. Wherever it says **confirm in App Store Connect**, look at App Store Connect (or the enrolment page) before you rely on the number.

Realistic timeline: enrolment a few days, first build and TestFlight a few days, App Review usually one to three days. Plan for two to three weeks from enrolment to a public listing, assuming the build is ready.

---

## Phase 0 – Have these ready before you start

- [ ] An Apple ID you will keep for years, with **two-factor authentication** switched on (Apple requires it for the Developer Program). Easiest on an iPhone or iPad signed in with that Apple ID; Apple's account page (`https://account.apple.com`) can also enable it with a trusted phone number – **confirm** which route Apple offers you.
- [ ] A government photo ID and a payment card in your own legal name.
- [ ] The privacy policy URL (`<PRIVACY POLICY URL>`, the GitHub Pages copy of `docs/privacy-policy.html`; the same page covers Android and iOS).
- [ ] A support URL. Apple requires one on every listing; the repository address `https://github.com/OWNER/bridgephoto` (placeholder) is fine, or the GitHub Pages site.
- [ ] The listing text (section 7 below), the 1024 × 1024 App Store icon (ask the developer; the iOS icon is built into the app, and App Store Connect takes it from the uploaded build) and screenshots taken on an iPhone (section 7).
- [ ] The GitHub repository set up so that you (or the developer) can add repository secrets and run the iOS workflow.

---

## Phase 1 – Enrol in the Apple Developer Program (individual)

1. [ ] Go to `https://developer.apple.com/programs/enroll/` and sign in with the Apple ID. Choose **Individual / Sole Proprietor**. In some countries Apple only accepts individual enrolment through the **Apple Developer app** on an iPhone or iPad, which scans your ID and takes a selfie; if the website sends you there, use it – **confirm** which applies in your country.
2. [ ] Enter your legal name, address and phone number, and agree to the Apple Developer Program License Agreement.
3. [ ] Identity verification: Apple may ask for the government photo ID and can take a few days to approve. You will get an email when the membership is active.
4. [ ] Pay the membership fee: **US$99 per year** (Apple's page states this; the exact amount and currency vary by country – **confirm**). Switch on automatic renewal if you want the app to stay online without a yearly reminder: if the membership lapses, the app is removed from the App Store until you renew.
5. [ ] Know what the public sees for an individual membership: the seller name shown on the App Store is your **legal name**, not a brand name (a company name needs an organisation enrolment with a D-U-N-S number). Decide before you enrol; **confirm in App Store Connect** under Agreements, Tax, and Banking / Business.
6. [ ] EU trader status: App Store Connect will ask whether you are a "trader" under the EU Digital Services Act. A free, non-commercial app from an individual can usually declare that you are **not** a trader; if you declare that you are, your address and contact details are shown on the EU App Store. Read Apple's explanation on the page and **confirm in App Store Connect**.
7. [ ] Accept every agreement Apple shows in App Store Connect → Agreements, Tax, and Banking. A free app needs only the free-apps agreement, but new versions of the Program License Agreement appear every year and Apple blocks uploads until the account holder accepts them.

---

## Phase 2 – Register the bundle ID

8. [ ] `https://developer.apple.com/account` → Certificates, Identifiers & Profiles → **Identifiers** → "+" → **App IDs** → **App**.
9. [ ] Description `BRIDGE PHOTO`; Bundle ID **Explicit**: `app.bridgephoto`. No capabilities are needed (no push notifications, no iCloud, no sign-in). Register.
10. [ ] The bundle ID must match the Flutter project's iOS bundle identifier exactly (the developer sets it in the Xcode project inside `ios/`). Confirm the spelling with the developer before the first build.

---

## Phase 3 – Create the app record in App Store Connect

11. [ ] `https://appstoreconnect.apple.com` → My Apps → "+" → **New App**.
12. [ ] Platforms: **iOS**. Name: `BRIDGE PHOTO` (max 30 characters; app names must be unique on the App Store – if it is taken, use `BRIDGE PHOTO - PDF Scanner`, 26 characters, or a similar variation; **confirm in App Store Connect**). Primary language: English (U.K.) or English (U.S.). Bundle ID: `app.bridgephoto`. SKU: any internal code, never shown to users, for example `bridgephoto-ios-1`. User Access: Full Access. Create.
13. [ ] The record now exists with version 1.0 waiting for a build.

---

## Phase 4 – App Store Connect API key for GitHub Actions

The workflow uploads builds with an App Store Connect API key, so nobody ever types the Apple ID password into GitHub.

14. [ ] App Store Connect → **Users and Access** → **Integrations** → **App Store Connect API** → Team Keys → "+" (Generate API Key).
15. [ ] Name: `GitHub Actions`. Access (role): **App Manager** is enough to upload builds and manage TestFlight. If the developer's workflow relies on Apple's cloud-managed signing to create the distribution certificate and profile automatically, it may need **Admin** instead – ask the developer what the workflow expects and **confirm in App Store Connect**.
16. [ ] Three values come out of this page and must be kept secret:
    - **Issuer ID** (shown at the top of the API keys page, the same for all keys),
    - **Key ID** (shown next to the key),
    - the **private key file** `AuthKey_<KEYID>.p8` – it can be downloaded **once only**. Download it, store it in a password manager, and never email or commit it.
17. [ ] Put the three values into the GitHub repository as **repository secrets**: repository → Settings → Secrets and variables → Actions → New repository secret. Typical names: `APP_STORE_CONNECT_ISSUER_ID`, `APP_STORE_CONNECT_KEY_ID`, `APP_STORE_CONNECT_PRIVATE_KEY` (the full text of the `.p8` file, including the BEGIN and END lines, or base64 if the workflow says so). Use the exact secret names the workflow file in the repository expects; the developer states them in the workflow or in its comments.
18. [ ] The workflow may need further secrets if it signs with a certificate instead of cloud-managed signing: an Apple Distribution certificate as a base64 `.p12` plus its password, and the provisioning profile. The developer creates those (a certificate request can be generated on Windows with OpenSSL, or by the workflow itself). Again, use the names the workflow expects.
19. [ ] Never put any of these values in the repository, in an issue or in a screenshot. If a key leaks, revoke it in App Store Connect (Users and Access → Integrations) and generate a new one.

---

## Phase 5 – Build and upload from GitHub Actions

20. [ ] Repository → **Actions** → the iOS workflow → **Run workflow** (or push the tag the workflow watches). GitHub's macOS runner installs Flutter, builds the signed iOS app (`flutter build ipa`) and uploads it to App Store Connect with the API key. GitHub-hosted runners, including macOS, are free for public repositories at the time of writing – **confirm** GitHub's current policy.
21. [ ] Every upload needs a build number higher than the last one. The workflow or the developer sets it; if an upload is rejected as a duplicate, that is the reason.
22. [ ] After the upload, App Store Connect → the app → **TestFlight** shows the build as "Processing" (usually 10 to 30 minutes), then ready.
23. [ ] **Export compliance.** For each new build App Store Connect asks whether the app uses encryption, unless `ITSAppUsesNonExemptEncryption` is set to `NO` in the app's `Info.plist`, which answers it automatically. The project's `ios/Runner/Info.plist` already sets it to `NO` (checked 17 September 2026), so the question should not appear. If it does appear anyway: BRIDGE PHOTO makes no network connections and does not encrypt files, so the honest answer is either "No, the app does not use encryption" or "Yes, only standard encryption exempt from documentation" (Flutter's engine contains a standard TLS library even though the app never opens a connection). Ask the developer which one matches the build and **confirm in App Store Connect**; either way a free app with no proprietary encryption needs no export documents.
24. [ ] If Apple emails a warning such as ITMS-91053 ("missing API declaration") after an upload, forward it to the developer: it means a privacy manifest entry for an API the app or a plugin uses is missing. It does not block TestFlight but must be fixed before review.

---

## Phase 6 – TestFlight

25. [ ] **Internal testing** (no review needed): TestFlight → Internal Testing → "+" → group name `Internal`. Internal testers must be members of your App Store Connect team: add them under Users and Access with any role (up to 100 internal testers). Enable automatic distribution so every new build reaches them.
26. [ ] Each tester installs the free **TestFlight** app from the App Store, opens the email invitation (or the code) and installs BRIDGE PHOTO from inside TestFlight. TestFlight builds expire after 90 days.
27. [ ] Test on the phone: scan an English page, check the OCR text and the searchable PDF, share to WhatsApp and Mail, save to Photos (the add-only Photos prompt should appear), merge two documents, import a PDF, switch dark mode, delete a document, uninstall (scans gone – expected).
28. [ ] **External testing** (optional, for more people): TestFlight → External Testing → "+" → group → add testers by email or turn on a **public link** (up to 10,000 testers). The first build of each version goes through Apple's short Beta App Review (usually about a day) before external testers get it. There is no minimum number of testers and no minimum test duration on Apple's side, unlike Google Play.
29. [ ] Collect feedback: testers can send screenshots and comments from inside TestFlight; they appear in App Store Connect under TestFlight → Feedback. Fix, rebuild, re-upload.

---

## Phase 7 – Fill in the App Store listing

### App Information

| Field | Answer |
|---|---|
| Name (max 30) | `BRIDGE PHOTO` (or the variation you registered) |
| Subtitle (max 30) | `Scan to PDF. No ads, no login` (29 characters) |
| Primary category | Productivity |
| Secondary category (optional) | Utilities |
| Content Rights | Does not contain, show or access third-party content |
| Age Rating | Answer **None / No** to every question in the questionnaire; the result should be **4+**. Apple revised the questionnaire and age tiers in 2025 – **confirm in App Store Connect**. |
| Privacy Policy URL | `<PRIVACY POLICY URL>` |
| License Agreement | Apple's standard EULA (leave the default) |

### App Privacy (the "nutrition label")

- App Store Connect → App Privacy → "Do you or your third-party partners collect data from this app?" → **No, we do not collect data from this app** → Publish.
- The listing then shows **Data Not Collected**. This is true on iOS: the app has no account, no analytics and no network access, and the scanner and OCR are Apple's own iOS frameworks, not third-party SDKs.
- If App Store Connect asks whether the app uses tracking (App Tracking Transparency) or an advertising identifier: **No**.

### Pricing and Availability

- Price: **Free** (price tier 0). Availability: all countries and regions. Pre-orders: no.

### Version 1.0 information

| Field | Answer |
|---|---|
| Screenshots | See "Screenshot sizes" below. |
| Promotional text (max 170, optional, editable without review) | `Free, open-source scanner for iPhone. No ads, no account, no tracking. On-device text recognition and searchable PDFs.` |
| Description (max 4,000) | The text under "App Store description" below. |
| Keywords (max 100 characters, comma-separated) | `scanner,pdf,scan,document,ocr,receipt,text recognition,camera,free,no ads` (73 characters) |
| Support URL (required) | `https://github.com/OWNER/bridgephoto` (placeholder) |
| Marketing URL (optional) | Leave blank or the GitHub Pages site |
| Version | `1.0` |
| Copyright | `2026 <DEVELOPER NAME>` |
| Build | Select the TestFlight build you tested |
| Sign-in required? | **No** |
| App Review contact | Your first name, last name, phone and email (Apple only; not shown publicly) |
| Notes for App Review | See "App Review notes" below. |
| Version release | "Manually release this version" if you want to choose the moment; otherwise automatic after approval |

### App Store description (max 4,000 characters; iOS facts only)

```
BRIDGE PHOTO is a free document scanner with no ads, no account and no tracking. Open the app, point it at the page, and the scan is captured, cropped and straightened on your iPhone.

PRIVATE BY DESIGN
• No ads, no in-app purchases, no subscriptions.
• No account and no sign-in.
• No analytics or crash-reporting SDKs. No tracking.
• The app makes no network connections. It asks for the camera only when you open the scanner, and for add-only access to Photos only if you choose "Save to Photos".
• Scans stay in the app's own storage on your iPhone. Nothing leaves the phone unless you share or export it.
• Open source under the Apache 2.0 licence, so anyone can check the code.

SCAN
• Multi-page scanning with the iOS document camera: autofocus, automatic capture, edge detection and perspective correction.
• Colour, greyscale and black-and-white.
• Add more pages to a document you scanned earlier.

ORGANISE
• Document list with rename, search and delete.
• Reorder, rotate and delete pages.
• Merge scanned documents into one. Merge existing PDF files. Import a PDF as pages.

TEXT RECOGNITION (OCR) ON YOUR IPHONE
• Recognises text with Apple's on-device Vision framework. English on every supported iOS version; other languages depend on your iOS version.
• Searchable PDFs: the recognised text is embedded as an invisible layer, so you can search the PDF and copy text out of it.
• Copy or share the recognised text on its own.
• Hindi and Nepali recognition are not available on iPhone in this version.

SHARE AND EXPORT
• Export or share as PDF, JPEG or PNG.
• Save to Photos, or send to WhatsApp, Mail or any app.

MORE
• Dark mode.
• Free, with nothing to unlock.
• Works on iOS 15 and later.

BRIDGE PHOTO is a small contribution to society from an individual developer, built after a well-known free, ad-free scanner app was retired at the end of 2025.
```

### App Review notes (paste into "Notes")

```
BRIDGE PHOTO is a document scanner. No account or sign-in exists; every feature is available immediately.
To test: tap Scan, allow the camera, capture one or more pages with the iOS document camera, then open the document to see the recognised text, share it as PDF from the share sheet, or save it to Photos (this triggers the add-only Photos prompt).
The app makes no network connections and collects no data. Scanning uses VisionKit and text recognition uses the Vision framework, both on the device. The source code is public at https://github.com/OWNER/bridgephoto (placeholder).
```

### Screenshot sizes (**confirm in App Store Connect**, which lists the current sizes next to each slot)

| Slot | Portrait size in pixels | How to get them without a Mac |
|---|---|---|
| iPhone 6.7-inch | 1290 × 2796 | Take screenshots on an iPhone with a 6.7-inch screen (for example iPhone 15 Pro Max / 15 Plus / 16 Plus) running the TestFlight build. |
| iPhone 6.5-inch | 1284 × 2778 or 1242 × 2688 | Take them on a 6.5-inch iPhone (for example iPhone 11 Pro Max / XS Max), or let App Store Connect reuse the 6.7-inch set if it offers to. |
| iPhone 6.9-inch (App Store Connect may now show this as the main slot) | 1320 × 2868 | iPhone 16 Pro Max screenshots are this size. If the slot is required, upload these; 6.7-inch and 6.5-inch are then usually optional. |
| iPad 13-inch / 12.9-inch | 2064 × 2752 or 2048 × 2732 | Only required if the build supports iPad. The project's Xcode settings currently target iPhone **and** iPad (`TARGETED_DEVICE_FAMILY = "1,2"`, checked 17 September 2026), so App Store Connect will ask for iPad screenshots: take them on an iPad running the TestFlight build, or ask the developer to restrict the build to iPhone before the first upload. |

Rules: PNG or JPEG, RGB, no transparency, up to 10 per slot, no device frames that hide the screen, no prices or ranking claims in the images. Use the same six scenes as the Android shot list in `docs/play-listing.md`, with the iOS scanner and, for scene 4, an English page (Hindi/Nepali OCR is Android-only).

---

## Phase 8 – Submit for review

30. [ ] Check the listing once more: privacy policy link opens, support URL opens, screenshots match the app, the build is selected, App Privacy is published, age rating is done, export compliance is answered.
31. [ ] Click **Add for Review** → **Submit to App Review**. Apple's review usually takes one to three days; a first submission can take longer.
32. [ ] Watch App Store Connect and your email. If Apple asks a question or rejects, reply in App Store Connect → the version → Resolution Center. Typical reasons for this kind of app: a crash on launch on a device Apple tested, a screenshot that does not match the app, a missing privacy policy link, or a request for more information about how the app works (answer plainly; the review notes above prevent most of these).
33. [ ] After approval, the app goes live automatically or when you press Release, depending on your choice in Version release. Open the App Store on an iPhone and check the listing.

---

## Phase 9 – Keep the app and the membership healthy

34. [ ] Renew the membership every year (US$99 – **confirm**). If it lapses, Apple removes the app from sale until you renew.
35. [ ] Accept new agreements in App Store Connect → Agreements, Tax, and Banking whenever a banner appears; until you do, uploads fail.
36. [ ] Apple requires apps to be built with a recent Xcode and iOS SDK: each year, from around April, new uploads must use the SDK Apple names in its announcement. The GitHub macOS runner and the workflow's Xcode version must keep up; the developer handles it, and you will see an upload error if it is out of date. **Confirm** the current rule on Apple's developer news page.
37. [ ] Read every email from Apple Developer and App Store Connect, and act on deadlines.
38. [ ] Keep the API key, the Apple ID password and the two-factor trusted devices safe; revoke and replace the API key if it ever leaks.
39. [ ] Whenever the app changes, update the privacy policy page, the App Privacy answers, the age rating if relevant, the listing text and `CHANGELOG.md`, and keep the Google Play listing in step (`play-console-checklist.md`).
