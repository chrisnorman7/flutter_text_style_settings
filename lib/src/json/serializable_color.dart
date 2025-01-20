import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'serializable_color.g.dart';

/// A serializable [Color].
@JsonSerializable()
class SerializableColor {
  /// Create an instance.
  const SerializableColor({
    required this.a,
    required this.r,
    required this.g,
    required this.b,
  });

  /// Create an instance from a JSON object.
  factory SerializableColor.fromJson(final Map<String, dynamic> json) =>
      _$SerializableColorFromJson(json);

  /// The a value.
  final double a;

  /// The r value.
  final double r;

  /// The g value.
  final double g;

  /// The b value.
  final double b;

  /// Return the color associated with this instance.
  @JsonKey(includeFromJson: false, includeToJson: false)
  Color get color => Color.from(alpha: a, red: r, green: g, blue: b);

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$SerializableColorToJson(this);

  /// Returns `true` if `this` instance has the same values as [other].
  bool isSameAs(final SerializableColor other) =>
      a == other.a && r == other.r && g == other.g && b == other.b;
}
