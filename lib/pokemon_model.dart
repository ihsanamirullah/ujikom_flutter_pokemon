import 'package:flutter/material.dart';

class Pokemon {
  final String name, type, hp, atk, def, spAtk, spDef, speed;
  final String ability, weakness, description, role, imagePath;

  Pokemon({
    required this.name, required this.type, required this.hp, required this.atk,
    required this.def, required this.spAtk, required this.spDef, required this.speed,
    required this.ability, required this.weakness, required this.description,
    required this.role, required this.imagePath,
  });
}

Color getPokemonColor(String type) {
  String mainType = type.split(' ')[0].toLowerCase().trim();
  switch (mainType) {
    case 'grass': return const Color(0xFF78C850);
    case 'fire': return const Color(0xFFF08030);
    case 'water': return const Color(0xFF6890F0);
    case 'electric': return const Color(0xFFF8D030);
    case 'ghost': return const Color(0xFF705898);
    case 'psychic': return const Color(0xFFF85888);
    case 'fighting': return const Color(0xFFC03028);
    case 'rock': return const Color(0xFFB8A038);
    case 'dragon': return const Color(0xFF7038F8);
    case 'normal': return const Color(0xFFA8A878);
    case 'steel': return const Color(0xFFB8B8D0);
    case 'dark': return const Color(0xFF705848);
    default: return Colors.grey;
  }
}