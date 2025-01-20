import 'package:flutter/material.dart';

/// A [Slider] widget which represents part of a color.
class ColorSlider extends StatelessWidget {
  /// Create an instance.
  const ColorSlider({
    required this.value,
    required this.onChanged,
    required this.label,
    this.autofocus = false,
    super.key,
  });

  /// The value to show.
  final double value;

  /// The function to call when [value] changes.
  final ValueChanged<double> onChanged;

  /// The label of this slider.
  final String label;

  /// Whether this [Slider] should be autofocused.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => Slider(
        value: value,
        onChanged: onChanged,
        autofocus: autofocus,
        divisions: 100,
        label: label,
        semanticFormatterCallback: (final value) =>
            '$label ${(value * 100).floor()}%',
      );
}
