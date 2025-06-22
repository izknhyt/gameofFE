import 'package:json_annotation/json_annotation.dart';

import 'tile.dart';
import 'unit.dart';

part 'stage.g.dart';

const int stageWidth = 24;
const int stageHeight = 16;

@JsonSerializable(explicitToJson: true)
class UnitPlacement {
  final int x;
  final int y;
  final Unit unit;

  UnitPlacement({required this.x, required this.y, required this.unit});

  factory UnitPlacement.fromJson(Map<String, dynamic> json) =>
      _$UnitPlacementFromJson(json);

  Map<String, dynamic> toJson() => _$UnitPlacementToJson(this);
}

@JsonSerializable(explicitToJson: true)
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

  factory Stage.fromJson(Map<String, dynamic> json) => _$StageFromJson(json);

  Map<String, dynamic> toJson() => _$StageToJson(this);
}
