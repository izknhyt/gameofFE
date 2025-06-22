// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
      hp: json['hp'] as int,
      mobility: json['mobility'] as int,
      affinity: json['affinity'] as String,
    );

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
      'hp': instance.hp,
      'mobility': instance.mobility,
      'affinity': instance.affinity,
    };
