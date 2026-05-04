class Pokemon {
  final String name;
  final String type;
  final String hp, atk, def, spAtk, spDef, speed;
  final String ability;
  final String weakness;
  final String description;
  final String role;
  final String imagePath;

  Pokemon({
    required this.name,
    required this.type,
    required this.hp,
    required this.atk,
    required this.def,
    required this.spAtk,
    required this.spDef,
    required this.speed,
    required this.ability,
    required this.weakness,
    required this.description,
    required this.role,
    required this.imagePath,
  });
}