class Pokemon {
  final int? id;
  final String name;
  final String image;
  final List<String> types;
  final int? height;
  final int? weight;
  final String? ability;

  Pokemon({
    this.id,
    required this.name,
    required this.image,
    required this.types,
    this.height,
    this.weight,
    this.ability,
  });
}