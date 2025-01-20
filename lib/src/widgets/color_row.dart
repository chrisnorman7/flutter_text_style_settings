import 'package:flutter/material.dart';

import '../json/serializable_color.dart';
import 'color_slider.dart';

/// A [Row] of sliders for editing [value] values.
class ColorRow extends StatelessWidget {
  /// Create an instance.
  const ColorRow({
    required this.value,
    required this.onChanged,
    this.alphaLabel = 'Alpha channel',
    this.redLabel = 'Red',
    this.greenLabel = 'Green',
    this.blueLabel = 'Blue',
    super.key,
  });

  /// The color to edit.
  final SerializableColor value;

  /// The function to call when [value] changes.
  final ValueChanged<SerializableColor> onChanged;

  /// The alpha label.
  final String alphaLabel;

  /// The red label.
  final String redLabel;

  /// The green label.
  final String greenLabel;

  /// The blue label.
  final String blueLabel;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) {
    final a = value.a;
    final r = value.r;
    final g = value.g;
    final b = value.b;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ColorSlider(
          value: a,
          onChanged: (final value) => onChanged(
            SerializableColor(a: value.round(), r: r, g: g, b: b),
          ),
          label: alphaLabel,
        ),
        ColorSlider(
          value: r,
          onChanged: (final value) => onChanged(
            SerializableColor(a: a, r: value.round(), g: g, b: b),
          ),
          autofocus: true,
          label: redLabel,
        ),
        ColorSlider(
          value: g,
          onChanged: (final value) => onChanged(
            SerializableColor(a: a, r: r, g: value.round(), b: b),
          ),
          label: greenLabel,
        ),
        ColorSlider(
          value: b,
          onChanged: (final value) => onChanged(
            SerializableColor(a: a, r: r, g: g, b: value.round()),
          ),
          label: blueLabel,
        ),
      ],
    );
  }
}
