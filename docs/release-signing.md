# Release signing (Android)

Google Play accepts only an **Android App Bundle** (`.aab`) signed with your **upload key**.
The key is created once, kept outside the repository, and used for every release for the life of the app.

## 1. Create the upload keystore (once)

Run on the build PC (JDK 17 is at `F:\Android\jdk-17.0.20.1+1`). Choose a strong password and write it down in a password manager first.

```bash
"F:\Android\jdk-17.0.20.1+1\bin\keytool" -genkeypair -v -keystore "F:\BridgePhoto-keys\upload-keystore.jks" -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

- `F:\BridgePhoto-keys\` is **outside** the repository on purpose. Create the folder first.
- Answer the name / organisation questions with anything sensible; they are not shown to users.
- Back the `.jks` file up in two places (encrypted USB stick and cloud drive). If it is lost, Google can reset the upload key, but it costs days.

## 2. Tell the build about it

Create `android/key.properties` (already ignored by git, never commit it):

```
storeFile=F:/BridgePhoto-keys/upload-keystore.jks
storePassword=YOUR_STORE_PASSWORD
keyAlias=upload
keyPassword=YOUR_KEY_PASSWORD
```

`android/app/build.gradle.kts` reads this file when it exists and signs release builds with it.
When the file is absent, release builds fall back to the debug key (fine for CI compile checks and sideloading, not for Play).

## 3. Build the bundle

```bash
cd F:\BridgePhoto
flutter build appbundle --release --flavor free
```

Output: `build/app/outputs/bundle/release/app-release.aab`. Upload it in the Play Console
(Testing → Internal testing first). When the Console asks about app signing, choose
"Use Google-generated key" (Play App Signing). Your upload certificate is registered automatically from the first upload.

## 4. Each later release

1. Raise `version:` in `pubspec.yaml`: `1.0.1+2`, `1.1.0+3`, … (the number after `+` is the versionCode and must always go up).
2. Add the changes to `CHANGELOG.md`.
3. `flutter build appbundle --release --flavor free`, upload, roll out.

## iOS

iOS signing is handled on the GitHub Actions macOS runner with an App Store Connect API key stored as repository secrets.
See `docs/app-store-checklist.md`.
