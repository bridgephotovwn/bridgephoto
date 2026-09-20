import java.io.FileInputStream
import java.util.Properties

// Release signing: android/key.properties (never committed) points at the upload keystore.
// Without it, release builds are signed with the debug key (fine for CI and sideloading).
val keystorePropertiesFile = rootProject.file("key.properties")
val keystoreProperties = Properties().apply {
    if (keystorePropertiesFile.exists()) FileInputStream(keystorePropertiesFile).use { load(it) }
}

plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "app.bridgephoto"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "app.bridgephoto"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 24
        targetSdk = flutter.targetSdkVersion
        // Uses the version code from pubspec.yaml. When using split APKs, 1000 * ABI_VERSION
        // is added automatically by Flutter. (https://developer.android.com/studio/build/configure-apk-splits#configure-APK-versions)
        // You can force using the value of versionCode by specifying the `-P force-version-code-ignoring-abi=true`
        // flag during build.
        versionCode = flutter.versionCode
        versionName = flutter.versionName

    }

    // --target-platform only trims Flutter's own library; the Tesseract .so
    // files would still ship for every CPU (about 20 MB of them). When a build
    // asks for ONE platform, drop the other CPUs at packaging time, which is
    // the one place nothing else can undo. An app bundle passes no platform,
    // so Play still gets every CPU and hands each phone only its own.
    packaging {
        val wanted = when (project.findProperty("target-platform") as String?) {
            "android-arm64" -> "arm64-v8a"
            "android-arm" -> "armeabi-v7a"
            "android-x64" -> "x86_64"
            else -> null
        }
        if (wanted != null) {
            for (abi in listOf("arm64-v8a", "armeabi-v7a", "x86", "x86_64")) {
                if (abi != wanted) jniLibs.excludes.add("lib/$abi/**")
            }
        }
    }

    // Two editions from one codebase.
    //   free     - the public BRIDGE PHOTO. No internet, ever. This is the app
    //              that is on Google Play, so its id and name must not change.
    //   business - the company edition, which sends scans to BRIDGE and is the
    //              only one allowed near the network. Its own id, so it
    //              installs beside the public app instead of replacing it.
    // The permission itself lives in each edition's manifest, and the check
    // below makes it impossible to ship the free app with internet.
    flavorDimensions += "edition"
    productFlavors {
        create("free") {
            dimension = "edition"
        }
        create("business") {
            dimension = "edition"
            applicationIdSuffix = ".business"
            versionNameSuffix = "-business"
        }
    }

    signingConfigs {
        create("release") {
            if (keystorePropertiesFile.exists()) {
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = file(keystoreProperties["storeFile"] as String)
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }

    buildTypes {
        release {
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
            signingConfig = if (keystorePropertiesFile.exists()) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }
            // Try a build next to the installed app instead of replacing it:
            //   flutter build apk --release -PidSuffix=.test
            // Leave the property out for anything that goes to a store.
            (project.findProperty("idSuffix") as String?)?.let { applicationIdSuffix = it }
        }
    }
}

// The promise the public app makes to the people using it is "this app cannot
// send anything anywhere". A person can forget; a build cannot. Every free
// build reads its own merged manifest and refuses to finish if INTERNET is in
// it, whether it came from us or from a library we pulled in.
androidComponents {
    onVariants { variant ->
        if (variant.flavorName != "free") return@onVariants
        // Debug and profile builds are exempt, and only those. Flutter's own
        // android/app/src/debug/AndroidManifest.xml adds INTERNET so the tool
        // can reach the running app for hot reload and breakpoints; those
        // builds are never published. Every RELEASE build - the only kind that
        // can reach a person - is still checked, so the promise is unchanged.
        if (variant.buildType != "release") return@onVariants
        val name = variant.name.replaceFirstChar { it.uppercase() }
        val verify = tasks.register<VerifyNoInternet>("verify${name}HasNoInternet") {
            mergedManifest.set(
                variant.artifacts.get(com.android.build.api.artifact.SingleArtifact.MERGED_MANIFEST)
            )
            report.set(layout.buildDirectory.file("reports/no-internet/$name.txt"))
        }
        tasks.matching { it.name == "assemble$name" || it.name == "bundle$name" }
            .configureEach { dependsOn(verify) }
    }
}

abstract class VerifyNoInternet : DefaultTask() {
    @get:InputFile
    abstract val mergedManifest: RegularFileProperty

    @get:OutputFile
    abstract val report: RegularFileProperty

    @TaskAction
    fun check() {
        val file = mergedManifest.get().asFile
        val text = file.readText()
        if (text.contains("android.permission.INTERNET")) {
            throw GradleException(
                "The public BRIDGE PHOTO asks for INTERNET, which it must never do.\n" +
                    "Something added it back - most likely a new library. Either keep it\n" +
                    "out of the free edition, or strip it in\n" +
                    "android/app/src/free/AndroidManifest.xml the way ML Kit's is stripped.\n" +
                    "Manifest: $file"
            )
        }
        report.get().asFile.writeText("no INTERNET permission in $file\n")
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Google ML Kit, on-device. Models are delivered by Google Play services.
    implementation("com.google.android.gms:play-services-mlkit-document-scanner:16.0.0")
    implementation("com.google.android.gms:play-services-base:18.11.0") // ModuleInstall (pre-download the scanner)
    implementation("com.google.android.gms:play-services-mlkit-text-recognition:19.0.1")
    implementation("com.google.android.gms:play-services-mlkit-text-recognition-devanagari:16.0.1")
    implementation("com.google.android.gms:play-services-mlkit-text-recognition-chinese:16.0.1")
    implementation("com.google.android.gms:play-services-mlkit-text-recognition-japanese:16.0.1")
    implementation("com.google.android.gms:play-services-mlkit-text-recognition-korean:16.0.1")
    // PDF merge (Apache-2.0)
    implementation("com.tom-roush:pdfbox-android:2.0.27.0")
    // Arabic text recognition. Google's ML Kit has no Arabic model, so Arabic
    // pages are read by Tesseract instead (Apache-2.0, entirely on device).
    // The .aar is kept in the repository rather than fetched from JitPack so a
    // release build never depends on someone else's build server staying up.
    implementation(files("libs/tesseract4android-4.9.0.aar"))
}
