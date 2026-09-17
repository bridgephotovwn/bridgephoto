# Contributing to BRIDGE PHOTO

Thank you for helping. BRIDGE PHOTO is a small, free, open-source scanner for Android and iPhone, and its main promise is privacy. Every change must keep that promise.

## Ground rules

1. **No network, no new permissions.** The Android manifest declares no permissions at all, not even `INTERNET`. On iOS the app asks only for the camera (when the scanner opens) and for add-only Photos access (when the user chooses "Save to Photos"). Pull requests that add a permission or prompt, a network call, analytics, crash reporting, ads, an account or any tracking will be declined, however useful the feature.
2. **Scans stay on the phone**, in the app's private storage. No cloud, no sync, no automatic backup.
3. **Truthful documents.** If your change affects what the app does with data or what it asks the user for, update `docs/privacy-policy.html`, `docs/play-listing.md`, `docs/app-store-checklist.md` and `CHANGELOG.md` in the same pull request.
4. Be kind and specific in issues and reviews.

## Reporting a bug

Open an issue at https://github.com/OWNER/bridgephoto/issues (placeholder address) with:

- Phone model and Android or iOS version.
- App version, and on Android the Google Play services version if you can find it.
- Steps to reproduce, what happened, and what you expected.
- Screenshots or a screen recording if it helps.

Never attach real documents, IDs or invoices. Use a page with made-up text instead. Do not include anyone's personal data in an issue.

## Suggesting a feature

Open an issue first and describe the problem you want solved, not only the solution. Features that need internet access, an account or new permissions do not fit this app; see the ground rules.

## Pull requests

- For anything bigger than a small fix, open an issue first so the approach can be agreed before you spend time on it.
- Keep each pull request focused on one change.
- Match the existing code style and structure (Flutter/Dart, with the small native engine per platform).
- Make sure `flutter build apk` succeeds (Flutter stable, JDK 17, Android SDK 36) and test on a real Android phone that has Google Play services. iOS changes need a test on a real iPhone; the repository's GitHub Actions workflow builds iOS on a macOS runner if you have no Mac.
- Add a line under **Unreleased** in `CHANGELOG.md`.
- Do not commit keystores, certificates, API keys, passwords or anything from a real user's phone.

By submitting a contribution you agree that it is licensed under the Apache License 2.0, the same licence as the project (see `LICENSE`, section 5).

## Translations

Translations of the app's text and of the store listings are welcome. Open an issue first so the process can be agreed.

## Security issues

If you find something that could expose a user's documents, do not open a public issue. Email `<CONTACT EMAIL>` (placeholder) and give us reasonable time to fix it before you publish anything.
