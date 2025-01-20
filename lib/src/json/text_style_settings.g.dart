// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_style_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextStyleSettings _$TextStyleSettingsFromJson(Map<String, dynamic> json) =>
    TextStyleSettings(
      fontSize: (json['fontSize'] as num).toDouble(),
      colorValue: SerializableColor.fromJson(
          json['colorValue'] as Map<String, dynamic>),
      backgroundColorValue: SerializableColor.fromJson(
          json['backgroundColorValue'] as Map<String, dynamic>),
      fontWeightValue: (json['fontWeightValue'] as num).toInt(),
      fontStyle: $enumDecode(_$FontStyleEnumMap, json['fontStyle']),
    );

Map<String, dynamic> _$TextStyleSettingsToJson(TextStyleSettings instance) =>
    <String, dynamic>{
      'fontSize': instance.fontSize,
      'colorValue': instance.colorValue,
      'backgroundColorValue': instance.backgroundColorValue,
      'fontWeightValue': instance.fontWeightValue,
      'fontStyle': _$FontStyleEnumMap[instance.fontStyle]!,
    };

const _$FontStyleEnumMap = {
  FontStyle.normal: 'normal',
  FontStyle.italic: 'italic',
};
