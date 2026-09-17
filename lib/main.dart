import 'dart:ui' show PlatformDispatcher;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'engine.dart';
import 'l10n/app_localizations.dart';
import 'prefs.dart';
import 'screens/home_screen.dart';
import 'store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Dart-side errors go to the private crash file too (never sent anywhere).
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    Engine.logError('FlutterError: ${details.exceptionAsString()}\n${details.stack ?? ''}');
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    Engine.logError('Uncaught: $error\n$stack');
    return true;
  };
  await Prefs.init();
  await DocStore.init();
  Engine.init();
  runApp(const BridgePhotoApp());
  Engine.warmUp(); // Android: pre-download the scanner module in the background
}

const kSeed = Color(0xFF0F766E);

class BridgePhotoApp extends StatelessWidget {
  const BridgePhotoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: Prefs.themeMode,
      builder: (context, mode, _) => MaterialApp(
        onGenerateTitle: (ctx) => AppLocalizations.of(ctx).appName,
        debugShowCheckedModeBanner: false,
        // Follows the phone's language; falls back to English.
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        themeMode: mode,
        theme: ThemeData(
          colorSchemeSeed: kSeed,
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorSchemeSeed: kSeed,
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

/// Small shared helpers for the screens.
extension SnackX on BuildContext {
  void snack(String msg) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(msg)));
  }

  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// Short date in the phone's language: "18 Sept" this year, "18 Sept 2025" otherwise.
String fmtDate(BuildContext context, int millis) {
  final t = DateTime.fromMillisecondsSinceEpoch(millis);
  final locale = Localizations.localeOf(context).toString();
  final sameYear = t.year == DateTime.now().year;
  return (sameYear ? DateFormat.MMMd(locale) : DateFormat.yMMMd(locale)).format(t);
}
