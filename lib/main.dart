import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/screens/onboarding/onboarding_screen.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      DevicePreview(
        enabled: !kDebugMode,
        builder: (context) => MyApp(),
        // Wrap your app
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Module',
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnboardingScreen()
    );
  }
}


