import 'dart:ui';

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
  final int a;

  /// The r value.
  final int r;

  /// The g value.
  final int g;

  /// The b value.
  final int b;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$SerializableColorToJson(this);
}
