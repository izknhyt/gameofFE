import 'tile.dart';
import 'unit.dart';

const int stageWidth = 24;
const int stageHeight = 16;

class UnitPlacement {
  final int x;
  final int y;
  final Unit unit;

  UnitPlacement({required this.x, required this.y, required this.unit});

  factory UnitPlacement.fromJson(Map<String, dynamic> json) {
    return UnitPlacement(
      x: json['x'] as int,
      y: json['y'] as int,
      unit: Unit.fromJson(json['unit'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'x': x,
        'y': y,
        'unit': unit.toJson(),
      };
}

class Stage {
  final List<List<Tile>> tiles;
  final List<UnitPlacement> units;

  Stage({required this.tiles, required this.units});

  factory Stage.empty() {
    return Stage(
      tiles: List.generate(
        stageHeight,
        (_) => List.generate(
          stageWidth,
          (_) => Tile(terrainType: 'plain'),
        ),
      ),
      units: [],
    );
  }

  factory Stage.fromJson(Map<String, dynamic> json) {
    var tilesJson = json['tiles'] as List<dynamic>;
    var tilesList = tilesJson
        .map((row) =>
            (row as List).map((tile) => Tile.fromJson(tile)).toList())
        .toList();
    var unitsJson = json['units'] as List<dynamic>;
    var unitList =
        unitsJson.map((u) => UnitPlacement.fromJson(u)).toList();
    return Stage(
      tiles: tilesList.cast<List<Tile>>(),
      units: unitList,
    );
  }

  Map<String, dynamic> toJson() => {
        'tiles':
            tiles.map((row) => row.map((t) => t.toJson()).toList()).toList(),
        'units': units.map((u) => u.toJson()).toList(),
      };
}
