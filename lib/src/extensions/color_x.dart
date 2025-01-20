import 'dart:ui';

import '../json/serializable_color.dart';

/// Useful methods for [Color]s.
extension ColorX on Color {
  /// Return a serializable color.
  SerializableColor get serializableColor =>
      SerializableColor(a: a, r: r, g: g, b: b);
}
