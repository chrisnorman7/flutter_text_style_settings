// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializable_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerializableColor _$SerializableColorFromJson(Map<String, dynamic> json) =>
    SerializableColor(
      a: (json['a'] as num).toDouble(),
      r: (json['r'] as num).toDouble(),
      g: (json['g'] as num).toDouble(),
      b: (json['b'] as num).toDouble(),
    );

Map<String, dynamic> _$SerializableColorToJson(SerializableColor instance) =>
    <String, dynamic>{
      'a': instance.a,
      'r': instance.r,
      'g': instance.g,
      'b': instance.b,
    };
