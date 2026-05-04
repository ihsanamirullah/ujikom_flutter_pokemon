import 'package:flutter/material.dart';
import '../pokemon_model.dart';

class DetailScreen extends StatelessWidget {
  final Pokemon pokemon;
  const DetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getPokemonColor(pokemon.type),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(pokemon.name, style: const TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250, width: double.infinity, color: getPokemonColor(pokemon.type).withOpacity(0.1),
              child: Hero(
  tag: pokemon.name,
  child: Padding(
    padding: const EdgeInsets.all(12), // Pindahkan padding ke sini
    child: Image.asset(
      pokemon.imagePath,
      fit: BoxFit.contain,
    ),
  ),
),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pokemon.name, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  const Text("Stats", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 16, runSpacing: 8,
                    children: [
                      _stat("HP", pokemon.hp), _stat("ATK", pokemon.atk), _stat("DEF", pokemon.def),
                      _stat("Sp. ATK", pokemon.spAtk), _stat("Sp. DEF", pokemon.spDef), _stat("Speed", pokemon.speed),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _section("Ability", pokemon.ability),
                  _section("Weakness", pokemon.weakness),
                  _section("Role", pokemon.role),
                  _section("Description", pokemon.description),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _stat(String l, String v) => Text("$l: $v", style: const TextStyle(fontWeight: FontWeight.bold));
  Widget _section(String t, String c) => Padding(padding: const EdgeInsets.only(bottom: 16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(t, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text(c)]));
}