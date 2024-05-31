import "package:pokemon_app/model/stats.dart";

class Pokemon {
  final int id;
  final String name;
  final int height;
  final int weight;
  final String sprite;
  final List<String> types;
  final List<String> abilities;
  final List<Stat> stats;

  Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.sprite,
    required this.types,
    required this.abilities,
    required this.stats,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<String> types = (json['types'] as List)
        .map((typeInfo) => typeInfo['type']['name'] as String)
        .toList();

    List<String> abilities = (json['abilities'] as List)
        .map((typeInfo) => typeInfo['ability']['name'] as String)
        .toList();

    return Pokemon(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      sprite: json['sprites']['front_default'],
      types: (json['types'] as List)
          .map((type) => type['type']['name'] as String)
          .toList(),
      abilities: (json['abilities'] as List)
          .map((ability) => ability['ability']['name'] as String)
          .toList(),
      stats:
          (json['stats'] as List).map((stat) => Stat.fromJson(stat)).toList(),
    );
  }
}
