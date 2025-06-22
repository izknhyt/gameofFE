// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tile.dart';

Tile _$TileFromJson(Map<String, dynamic> json) => Tile(
      terrainType: json['terrainType'] as String,
      effects: json['effects'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$TileToJson(Tile instance) => <String, dynamic>{
      'terrainType': instance.terrainType,
      'effects': instance.effects,
    };
