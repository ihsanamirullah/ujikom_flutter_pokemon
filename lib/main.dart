import 'package:flutter/material.dart';
import 'package:pokemon/dashboard_screen.dart';

void main() {
  runApp(const SilphPokemonApp());
}

class SilphPokemonApp extends StatelessWidget {
  const SilphPokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silph Pokemon Database - Muhammad Ihsan Amirullah - Kelas 9D',
      theme: ThemeData(
        primaryColor: const Color(0xFFC00000),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}