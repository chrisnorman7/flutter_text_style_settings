import 'package:flutter/material.dart';

/// A [fontWeight] with a [name].
class FontWeightPreset {
  /// Create an instance.
  const FontWeightPreset({required this.fontWeight, required this.name});

  /// The font weight to represent.
  final FontWeight fontWeight;

  /// The name of the [fontWeight].
  final String name;
}
