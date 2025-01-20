import 'package:flutter/material.dart';
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
      colorValue: (style.color ?? defaultColor).serializableColor,
      backgroundColorValue:
          (style.backgroundColor ?? defaultBackgroundColor).serializableColor,
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
  Color get color => colorValue.color;

  /// The value of the [backgroundColor].
  final SerializableColor backgroundColorValue;

  /// The background color.
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color get backgroundColor => backgroundColorValue.color;

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

  /// Get a text style which matches this instance.
  TextStyle get textStyle => TextStyle(
        backgroundColor: backgroundColor,
        color: color,
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
      );

  /// Copy this instance.
  TextStyleSettings copyWith({
    final double? fontSize,
    final SerializableColor? colorValue,
    final SerializableColor? backgroundColorValue,
    final int? fontWeightValue,
    final FontStyle? fontStyle,
  }) =>
      TextStyleSettings(
        fontSize: fontSize ?? this.fontSize,
        colorValue: colorValue ?? this.colorValue,
        backgroundColorValue: backgroundColorValue ?? this.backgroundColorValue,
        fontWeightValue: fontWeightValue ?? this.fontWeightValue,
        fontStyle: fontStyle ?? this.fontStyle,
      );
}
