import 'package:flutter/material.dart';
import '../pokemon_data.dart';
import '../pokemon_model.dart';
import 'dashboard_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  // 1. Variabel untuk menampung hasil filter
  List<Pokemon> filteredPokemon = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Awalnya tampilkan semua pokemon
    filteredPokemon = allPokemon;
  }

  // 2. Fungsi Logika Pencarian
  void _filterPokemon(String query) {
    setState(() {
      filteredPokemon = allPokemon
          .where((pokemon) =>
              pokemon.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC00000),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Pokemon List", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 3. Search Bar dengan OnChanged
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _filterPokemon, // Panggil fungsi filter saat ngetik
                decoration: const InputDecoration(
                  hintText: "Search your Pokemon",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // 4. GridView menggunakan hasil filter
            Expanded(
              child: filteredPokemon.isEmpty
                  ? const Center(child: Text("Pokemon tidak ditemukan..."))
                  : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: filteredPokemon.length,
                      itemBuilder: (context, index) =>
                          PokemonCard(pokemon: filteredPokemon[index]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}