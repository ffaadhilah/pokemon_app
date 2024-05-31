class Stat {
  final int baseStat;
  final String name;

  Stat({
    required this.baseStat,
    required this.name,
  });

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      baseStat: json['base_stat'],
      name: json['stat']['name'],
    );
  }
}
