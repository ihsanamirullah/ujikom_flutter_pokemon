import 'package:flutter/material.dart';
import '../pokemon_data.dart';
import '../pokemon_model.dart';
import 'dashboard_screen.dart';

class ListScreen extends StatefulWidget {
  final String? initialQuery;
  const ListScreen({super.key, this.initialQuery});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Pokemon> filteredPokemon = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialQuery != null) {
      _searchController.text = widget.initialQuery!;
      _filterPokemon(widget.initialQuery!);
    } else {
      filteredPokemon = allPokemon;
    }
  }

  void _filterPokemon(String query) {
    setState(() {
      filteredPokemon = allPokemon
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
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
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(30)),
              child: TextField(
                controller: _searchController,
                onChanged: _filterPokemon,
                decoration: const InputDecoration(hintText: "Search your Pokemon", prefixIcon: Icon(Icons.search), border: InputBorder.none),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredPokemon.isEmpty 
                ? const Center(child: Text("Gak ketemu, San!"))
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75, crossAxisSpacing: 16, mainAxisSpacing: 16),
                    itemCount: filteredPokemon.length,
                    itemBuilder: (context, index) => PokemonCard(pokemon: filteredPokemon[index]),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}