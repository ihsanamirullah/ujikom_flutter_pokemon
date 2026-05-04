import 'package:flutter/material.dart';
import 'package:pokemon/pokemon_detail_screen.dart';
import 'package:pokemon/pokemon_list_screen.dart';
import '../pokemon_model.dart';
import '../pokemon_data.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFC00000),
        title: const Text(
          "Silph Pokemon Database",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hi There,", style: TextStyle(fontSize: 22)),
            const SizedBox(height: 8),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: "Let's find "),
                  TextSpan(
                    text: "information ",
                    style: TextStyle(color: Color(0xFFC00000)),
                  ),
                  TextSpan(text: "about your "),
                  TextSpan(text: "Pokemon"),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Image.asset('assets/pokemon_logo.png', height: 60),
            const SizedBox(height: 24),
            // SEARCH BAR REDIRECT
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListScreen(initialQuery: value),
                      ),
                    );
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Search your Pokemon",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Popular Pokemon",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allPokemon.length > 4 ? 4 : allPokemon.length,
                itemBuilder: (context, index) =>
                    PokemonCard(pokemon: allPokemon[index]),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListScreen()),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC00000),
                  foregroundColor: Colors.white,
                ),
                child: const Text("See more"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailScreen(pokemon: pokemon)),
      ),
      child: Container(
        width: 170,
        margin: const EdgeInsets.only(right: 16, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: getPokemonColor(pokemon.type).withOpacity(0.2),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Hero(
                  tag: pokemon.name,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(pokemon.imagePath, fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: getPokemonColor(pokemon.type),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      pokemon.type,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
