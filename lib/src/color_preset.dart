import 'package:flutter/material.dart';

/// A [color] with a [name].
class ColorPreset {
  /// Create an instance.
  const ColorPreset({
    required this.color,
    required this.name,
  });

  /// The color to use.
  final Color color;

  /// The name of [color].
  final String name;
}
