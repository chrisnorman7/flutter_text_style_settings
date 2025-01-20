import 'dart:ui';

import 'package:flutter/material.dart' hide Color;
import 'package:json_annotation/json_annotation.dart';

import '../extensions/color_x.dart';
import 'serializable_color.dart';

part 'text_style_settings.g.dart';

/// A class to serialize [TextStyle] settings.
@JsonSerializable()
class TextStyleSettings {
  /// Create an instance.
  const TextStyleSettings({
    required this.fontSize,
    required this.colorValue,
    required this.backgroundColorValue,
    required this.fontWeightValue,
    required this.fontStyle,
  });

  /// Create an instance from the [DefaultTextStyle] of [context].
  factory TextStyleSettings.from(
    final BuildContext context, {
    final double defaultFontSize = 16.0,
    final Color defaultColor = Colors.black,
    final Color defaultBackgroundColor = Colors.yellow,
  }) {
    final style = DefaultTextStyle.of(context).style;
    return TextStyleSettings(
      fontSize: style.fontSize ?? defaultFontSize,
      colorValue:
          style.color?.serializableColor ?? defaultColor.serializableColor,
      backgroundColorValue: style.backgroundColor?.serializableColor ??
          defaultBackgroundColor.serializableColor,
      fontWeightValue: style.fontWeight?.value ?? FontWeight.normal.value,
      fontStyle: style.fontStyle ?? FontStyle.normal,
    );
  }

  /// Create an instance from a JSON object.
  factory TextStyleSettings.fromJson(final Map<String, dynamic> json) =>
      _$TextStyleSettingsFromJson(json);

  /// The font size to use.
  final double fontSize;

  /// The value of the [color].
  final SerializableColor colorValue;

  /// The foreground color.
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color get color =>
      Color.fromARGB(colorValue.a, colorValue.r, colorValue.g, colorValue.b);

  /// The value of the [backgroundColor].
  final SerializableColor backgroundColorValue;

  /// The background color.
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color get backgroundColor => Color.fromARGB(
        backgroundColorValue.a,
        backgroundColorValue.r,
        backgroundColorValue.g,
        backgroundColorValue.b,
      );

  /// The value of the [fontWeight].
  final int fontWeightValue;

  /// The font weight to use.
  @JsonKey(includeFromJson: false, includeToJson: false)
  FontWeight get fontWeight {
    for (final value in FontWeight.values) {
      if (value.value == fontWeightValue) {
        return value;
      }
    }
    throw UnsupportedError(
      'Cannot convert a font weight value of $fontWeightValue.',
    );
  }

  /// The font style to use.
  final FontStyle fontStyle;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$TextStyleSettingsToJson(this);
}
