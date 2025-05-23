import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:inspira_app/home_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Atur ke false jika tidak ingin mengaktifkan preview
      builder: (context) => const InspiraAIApp(),
    ),
  );
}

class InspiraAIApp extends StatelessWidget {
  const InspiraAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InspiraAI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      builder: DevicePreview.appBuilder,  // Ini untuk memungkinkan DevicePreview bekerja
    );
  }
}
