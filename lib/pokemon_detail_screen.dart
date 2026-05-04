import 'package:flutter/material.dart';
import '../pokemon_model.dart';

class DetailScreen extends StatelessWidget {
  final Pokemon pokemon;
  const DetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC00000),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
        title: const Text("Silph Pokemon Database", style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(pokemon.imagePath, width: double.infinity, height: 250, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pokemon.name, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(color: Colors.yellow[200], borderRadius: BorderRadius.circular(4)),
                    child: Text(pokemon.type, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 24),
                  const Text("Stats", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  _buildStatRow("HP", pokemon.hp, "ATK", pokemon.atk, "DEF", pokemon.def, "Sp. ATK", pokemon.spAtk),
                  _buildStatRow("Sp. DEF", pokemon.spDef, "Speed", pokemon.speed, "", "", "", ""),
                  const SizedBox(height: 24),
                  _buildDetailSection("Ability", pokemon.ability),
                  _buildDetailSection("Weakness", pokemon.weakness),
                  _buildDetailSection("Role", pokemon.role),
                  _buildDetailSection("Description", pokemon.description),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String s1, String v1, String s2, String v2, String s3, String v3, String s4, String v4) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          _statItem(s1, v1), _statItem(s2, v2), _statItem(s3, v3), _statItem(s4, v4),
        ],
      ),
    );
  }

  Widget _statItem(String label, String value) {
    if (label == "") return const Expanded(child: SizedBox());
    return Expanded(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 12),
          children: [
            TextSpan(text: "$label ", style: const TextStyle(color: Colors.grey)),
            TextSpan(text: value, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(content, style: const TextStyle(color: Colors.black87, height: 1.5)),
        ],
      ),
    );
  }
}