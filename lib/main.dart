import 'package:flutter/material.dart';
import 'package:pokemon/home_screen.dart';

void main() {
  runApp(const SilphApp());
}

class SilphApp extends StatelessWidget {
  const SilphApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silph Pokemon Database',
      theme: ThemeData(
        primaryColor: const Color(0xFFC00000),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}