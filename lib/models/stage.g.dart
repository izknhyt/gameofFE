// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage.dart';

UnitPlacement _$UnitPlacementFromJson(Map<String, dynamic> json) => UnitPlacement(
      x: json['x'] as int,
      y: json['y'] as int,
      unit: Unit.fromJson(json['unit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UnitPlacementToJson(UnitPlacement instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'unit': instance.unit.toJson(),
    };

Stage _$StageFromJson(Map<String, dynamic> json) => Stage(
      tiles: (json['tiles'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => Tile.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      units: (json['units'] as List<dynamic>)
          .map((e) => UnitPlacement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StageToJson(Stage instance) => <String, dynamic>{
      'tiles': instance.tiles
          .map((e) => e.map((e) => e.toJson()).toList())
          .toList(),
      'units': instance.units.map((e) => e.toJson()).toList(),
    };
