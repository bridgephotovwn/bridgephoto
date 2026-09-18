# BRIDGE PHOTO – from zero to public release on Google Play (Android)

A step-by-step checklist for the owner. It assumes a brand-new **personal** Google Play developer account and the release AAB of BRIDGE PHOTO (package `app.bridgephoto`, version 1.0, versionCode 1) supplied by the app developer. The iPhone release is a separate process: see `app-store-checklist.md`.

Numbers and rules in this file were checked against Google's help pages on 17 September 2026. Google changes them. Wherever it says **confirm in the Play Console**, look at the Console before you act on the number.

Realistic timeline: account verification a few days, tester recruitment about a week, closed test 14 days minimum, production access review up to about a week, production review a few days. Plan for four to six weeks from first login to public listing.

---

## Phase 0 – Have these ready before you start

- [ ] A Google account you will keep for years. Use the account you want to own the app; the owner cannot easily be changed later. Switch on 2-Step Verification for it.
- [ ] A credit or debit card in your own legal name for the registration fee. Google does not accept prepaid cards.
- [ ] A government ID in the same legal name (passport, Emirates ID or similar) for identity verification.
- [ ] A phone number and an email address you can verify with a code.
- [ ] The public contact email for the listing (`bridgephoto.vwn@gmail.com`). It will be visible to everyone on Google Play, so use an address you are happy to show and will keep reading.
- [ ] The privacy policy online: publish `docs/privacy-policy.html` on GitHub Pages (repository → Settings → Pages → deploy from the main branch, folder `/docs`). The address will look like `https://bridgephotovwn.github.io/bridgephoto/privacy-policy.html`. Open it on a phone to check it loads without a login. The same page serves the App Store listing.
- [ ] The graphic assets: `docs/icon-512-play.png`, `docs/feature-graphic.png`, and at least two phone screenshots (see the shot list in `docs/play-listing.md`).
- [ ] The listing text from `docs/play-listing.md`.
- [ ] The release AAB (`.aab`, not `.apk`) from the app developer, built with `flutter build appbundle` and signed with an **upload key**. Ask the developer for the upload keystore file and its passwords (Flutter keeps them in `android/key.properties`, which must never be committed), and keep a copy in two safe places (for example an encrypted USB stick and a password manager). If the upload key is lost you can ask Google for an upload-key reset, but it costs days.

---

## Phase 1 – Create the developer account

1. [ ] Go to `https://play.google.com/console` and sign in with the chosen Google account.
2. [ ] Choose the account type: **Yourself** (personal). Note before you continue: a personal account shows your own name to the public. An organisation account instead shows the business name, address and phone, and needs a D-U-N-S number for the business. The account type is hard to change afterwards, so decide now.
3. [ ] Fill in the developer profile: public developer name (`BRIDGE PHOTO`), contact email (verified by a code), contact phone (verified by a code), legal name and legal address, and your developer experience answers.
4. [ ] Pay the **one-time registration fee, US$25** (Google's page states this figure; the card and the ID must be in the same legal name).
5. [ ] Verify your identity when the Console asks: upload the government ID and follow the prompts. Verification usually takes days, sometimes longer. You cannot publish until it is done.
6. [ ] Read and accept the Google Play Developer Distribution Agreement.
7. [ ] Know what the public sees for a personal account: your developer name, your contact email address and your country. Google's verification help page also says your legal name is displayed, and that your full address is shown if you ever monetise (paid app or in-app purchases). BRIDGE PHOTO is free, so the address rule does not apply. **Confirm in the Play Console** on the "Account details" page, which states exactly what will be shown, before you go live.
8. [ ] Google's registration page also mentions "device verification" requirements for new personal accounts. If the Console asks you to verify a device, follow its steps; **confirm in the Play Console** what it wants.

---

## Phase 2 – Create the app and fill in the listing

9. [ ] All apps → **Create app**. App name `BRIDGE PHOTO - PDF Scanner`, default language (English), **App** (not game), **Free**. Tick the policy and US export declarations. Once created as free, it cannot be changed to paid.
10. [ ] On the dashboard, open **Set up your app** and complete every task using the answers in `docs/play-listing.md`, section 3: privacy policy URL, app access, ads, content rating, target audience, news apps, COVID-19 apps, data safety (read the ML Kit note there first and choose answer set A or B), government apps, financial features, health apps, advertising ID, and any new declaration Google has added.
11. [ ] **Main store listing**: paste the app name, short description and full description; upload the icon (`icon-512-play.png`), the feature graphic and the phone screenshots; set the category to Productivity; choose tags; enter the contact email and the website (the repository address).
12. [ ] **Store settings**: category, tags, contact details, external marketing choice.
13. [ ] Save everything. The dashboard shows a tick for each completed task; every task must be green before a closed-testing or production release can be reviewed.

---

## Phase 3 – Play App Signing and the first upload (Internal testing)

14. [ ] Understand the two keys. With **Play App Signing** Google holds the *app signing key* that signs what users install; you hold the *upload key* that signs what you upload. New apps must use Play App Signing and must be uploaded as an Android App Bundle (AAB). Users on the Play Store get APKs generated from your AAB by Google.
15. [ ] Testing → **Internal testing** → Create new release. When the Console asks about app signing, choose **"Use Google-generated key"** (let Google manage and protect the app signing key). The certificate of the key you signed the AAB with becomes your registered upload key.
16. [ ] Upload the AAB. Check the version shown (1.0, versionCode 1), that the minimum Android version reads 7.0 (API 24), and that no warnings about permissions appear (the only one listed should be ACCESS_NETWORK_STATE; there must be no INTERNET).
17. [ ] Release name (for example `1.0 (1)`), release notes (from `docs/play-listing.md`), Save, **Review release**, **Start rollout to Internal testing**. Internal releases are not reviewed by Google and appear within minutes.
18. [ ] Testers tab → create an email list with yourself, the developer and two or three staff (internal testing allows up to 100 testers). Copy the opt-in link and open it on each phone, join, then install from the Play Store. Check: scanning, OCR of an English and a Nepali page, searchable PDF, share to WhatsApp, merge, dark mode, uninstall/reinstall (scans are gone after uninstall – that is expected).
19. [ ] Fix anything found: the developer supplies a new AAB with a higher versionCode; repeat the upload on the same track. versionCode can only go up.

---

## Phase 4 – Closed testing: the 14-day rule for new personal accounts

20. [ ] Know the rule. New personal accounts created after 13 November 2023 cannot use the Production track until they run a **closed test with at least 12 testers who stay opted in continuously for at least 14 days**. Google's help page states 12 today; the figure has changed before (it used to be 20), so **confirm the number in the Play Console** – the dashboard shows the requirement and your progress. Testers who opt in, test for fewer than 14 days and then opt out do not count.
21. [ ] Testing → **Closed testing** → create a track (the default is called "Alpha") → Testers → create an email list (Google Groups also work). Add more than the minimum: aim for 15 to 20 people, so that a few drop-outs do not break the count.
22. [ ] Create a release on the closed track (the same AAB or a newer one) → Review → Start rollout. Google reviews closed-testing releases; the first review can take days. Meanwhile check the **Pre-launch report** in the Console for crashes on Google's test devices.
23. [ ] Recruit testers: family, staff, friends, the business's WhatsApp groups. Each tester needs an Android phone with the Play Store and a Google account whose email you add to the list. Message to send (edit as you like):

    > I am publishing a free document scanner app, BRIDGE PHOTO, on Google Play. Google requires a 14-day test before it goes public. Please: (1) reply with the Gmail address you use on your phone, (2) open the link I send you and tap "Become a tester", (3) install the app from the Play Store link, (4) keep it installed and scan a few pages when you can, (5) tell me anything that looks wrong. Please do not leave the test for at least two weeks.

24. [ ] After adding their emails, send each tester the opt-in link from the Testers tab (it looks like `https://play.google.com/apps/testing/app.bridgephoto`). They must tap **Become a tester** on that page and then install from the Play Store. Only opted-in testers count.
25. [ ] Keep testers opted in for the whole 14 days. Ask them not to tap "Leave the programme". Keep a simple list of who has joined, and check the Console's tester count every few days.
26. [ ] Use the 14 days: collect feedback in a WhatsApp group, log bugs, and roll out fixed AABs to the same closed track. Updates do not restart the clock as far as Google's rule states (it counts testers' continuous opt-in, not versions) – **confirm in the Play Console**, which shows days remaining.
27. [ ] Keep notes: how you found testers, how many joined, what they reported, what you changed. The production-access application asks for exactly this.

---

## Phase 5 – Apply for production access

28. [ ] When the dashboard shows the requirement as met, click **Apply for production access**. The application has three parts: about your closed test (how you recruited testers, how engaged they were, a summary of feedback), about your app (who it is for, what value it gives, expected installs), and about your production readiness (what you changed after testing, why the app is ready). Write specific, honest answers; short is fine.
29. [ ] Google says the review usually takes seven days or less, sometimes longer. Do not submit again while it is pending.
30. [ ] If Google declines, read the reason, improve the test or the answers, and apply again.

---

## Phase 6 – Production release

31. [ ] Release → **Production** → Countries / regions → add all available countries.
32. [ ] Create new release → upload the final AAB (a new, higher versionCode if anything changed since the closed test) → release notes → Review → **Start rollout to Production**. A staged rollout (for example 20% first) is optional; for a first release 100% is fine.
33. [ ] Google reviews the production release. Reviews of new apps from new accounts can take a week or longer. The Console shows the status; you get an email when it is live.
34. [ ] Once live: open the listing on a phone, check the icon, screenshots, Data safety text and privacy policy link; install from the store and run one full scan-and-share cycle.
35. [ ] Optional: turn on **Managed publishing** (Publishing overview) before a later update if you want to choose the exact moment an approved update goes live.

---

## Phase 7 – Keep the app and the account healthy

36. [ ] **Target SDK, every year.** Google requires new apps and app updates to target the Android version from the previous year by **31 August** each year, with a possible extension to 1 November on request. In 2026 that means Android 16 (API level 36). BRIDGE PHOTO is built against SDK 36, so it meets the 2026 rule; each August, check the current requirement under Policy status in the Console and ask the developer for an update if needed. Apps that fall behind stop being visible to users on newer Android versions.
37. [ ] **Policy emails must not be ignored.** Google sends policy notices to the account email with deadlines (often 30 days or less). Missing one can mean the app is removed or the account terminated. Read every email from Google Play; check Policy status in the Console monthly; act before the deadline; appeal through the Console if you disagree.
38. [ ] Keep the account alive: log in to the Console from time to time and keep the contact email and phone current. Google has said it may close developer accounts that stay inactive; **confirm in the Play Console** and in Google's policy emails.
39. [ ] Keep the secrets safe: the Google account (2-Step Verification, recovery phone and email), the upload keystore and its passwords, and the Play Console's "Account details" page.
40. [ ] Whenever the app changes, update in this order: the privacy policy page (new effective date), the Data safety form, the content-rating questionnaire if the answers change, the store listing text, `CHANGELOG.md`. Adding a permission, network access, ads or an account would change all of them; adding another OCR script would change only the listing text. Keep the App Store listing in step with it (`app-store-checklist.md`).
41. [ ] Reply to user reviews politely in the Console; they are public and Google's reviewers read them too.
