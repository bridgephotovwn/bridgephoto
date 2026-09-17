import 'dart:ui' show PlatformDispatcher;

import 'package:flutter/material.dart';

import 'engine.dart';
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
        title: 'BRIDGE PHOTO',
        debugShowCheckedModeBanner: false,
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
}

String fmtDate(int millis) {
  final t = DateTime.fromMillisecondsSinceEpoch(millis);
  const m = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  final now = DateTime.now();
  final y = t.year == now.year ? '' : ' ${t.year}';
  return '${t.day} ${m[t.month - 1]}$y';
}
