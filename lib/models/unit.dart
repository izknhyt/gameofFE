class Unit {
  int hp;
  int mobility;
  String affinity;

  Unit({required this.hp, required this.mobility, required this.affinity});

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      hp: json['hp'] as int,
      mobility: json['mobility'] as int,
      affinity: json['affinity'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'hp': hp,
        'mobility': mobility,
        'affinity': affinity,
      };
}
