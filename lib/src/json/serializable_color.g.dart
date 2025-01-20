// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializable_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerializableColor _$SerializableColorFromJson(Map<String, dynamic> json) =>
    SerializableColor(
      a: (json['a'] as num).toInt(),
      r: (json['r'] as num).toInt(),
      g: (json['g'] as num).toInt(),
      b: (json['b'] as num).toInt(),
    );

Map<String, dynamic> _$SerializableColorToJson(SerializableColor instance) =>
    <String, dynamic>{
      'a': instance.a,
      'r': instance.r,
      'g': instance.g,
      'b': instance.b,
    };
