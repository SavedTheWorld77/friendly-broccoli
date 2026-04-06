import 'dart:developer';

import 'package:dev_portfolio/firebase_options.dart';
import 'package:dev_portfolio/screens/landing_page.dart';
import 'package:dev_portfolio/theme/app_theme.dart';
import 'package:dev_portfolio/widgets/app_text_scale.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  //   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rhen Dev Portfolio',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      home: AppTextScale.builder(
        child: LandingPage(onToggle: () => toggleTheme()),
      ),
    );
  }
}

Future<void> _initializeFirebase() async {
  try {
    // Only initialize if no apps exist
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  } catch (e) {
    log('Firebase initialization failed: $e');
  }
}
