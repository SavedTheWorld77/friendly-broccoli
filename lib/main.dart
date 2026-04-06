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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.dark,
      home: AppTextScale.builder(child: LandingPage()),
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
