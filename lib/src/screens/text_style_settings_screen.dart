import 'package:flutter/material.dart';

import '../../flutter_text_style_settings.dart';

/// A widget which shows [exampleText].
class _ExampleText extends StatelessWidget {
  /// Create an instance.
  const _ExampleText({
    required this.exampleText,
    required this.placement,
    required this.textStyle,
  });

  /// The text to show.
  final String exampleText;

  /// The placement to use.
  final ExampleTextPlacement placement;

  /// The text style to use.
  final TextStyle textStyle;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => Row(
        crossAxisAlignment: switch (placement) {
          ExampleTextPlacement.topLeft => CrossAxisAlignment.start,
          ExampleTextPlacement.topCenter => CrossAxisAlignment.center,
          ExampleTextPlacement.topRight => CrossAxisAlignment.end,
          ExampleTextPlacement.bottomLeft => CrossAxisAlignment.start,
          ExampleTextPlacement.bottomCenter => CrossAxisAlignment.center,
          ExampleTextPlacement.bottomRight => CrossAxisAlignment.end,
        },
        children: [
          Text(
            exampleText,
            style: textStyle,
          ),
        ],
      );
}

/// The default save button.
Widget defaultSaveButtonBuilder(
  final BuildContext context,
  final VoidCallback onPressed,
) =>
    FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Save',
      child: const Icon(Icons.save),
    );

/// A screen to edit [textStyleSettings].
class TextStyleSettingsScreen extends StatefulWidget {
  /// Create an instance.
  const TextStyleSettingsScreen({
    required this.textStyleSettings,
    required this.onChanged,
    this.title = 'Edit Text Style',
    this.fontSizeLabel = 'Font size',
    this.minFontSize = 6,
    this.maxFontSize = 2048,
    this.menuIcon = Icons.more_vert,
    this.fontWeightPresets = const [
      FontWeightPreset(fontWeight: FontWeight.w100, name: 'w100: Thin'),
      FontWeightPreset(fontWeight: FontWeight.w200, name: 'w200: Extra light'),
      FontWeightPreset(fontWeight: FontWeight.w300, name: 'w300'),
      FontWeightPreset(fontWeight: FontWeight.w400, name: 'w400: Normal'),
      FontWeightPreset(fontWeight: FontWeight.w500, name: 'w500'),
      FontWeightPreset(fontWeight: FontWeight.w600, name: 'w600'),
      FontWeightPreset(fontWeight: FontWeight.w700, name: 'w700: Bold'),
      FontWeightPreset(fontWeight: FontWeight.w800, name: 'w800'),
      FontWeightPreset(fontWeight: FontWeight.w900, name: 'w900: Black'),
    ],
    this.fontWeightLabel = 'Font weight',
    this.fontStyleLabel = 'Font style',
    this.alphaLabel = 'Alpha',
    this.redLabel = 'Red',
    this.greenLabel = 'Green',
    this.blueLabel = 'Blue',
    this.colorPresets = const [
      ColorPreset(color: Colors.black, name: 'Black'),
      ColorPreset(color: Colors.white, name: 'White'),
      ColorPreset(color: Colors.yellow, name: 'Yellow'),
      ColorPreset(color: Colors.green, name: 'Green'),
      ColorPreset(color: Colors.blue, name: 'Blue'),
      ColorPreset(color: Colors.red, name: 'Red'),
      ColorPreset(color: Colors.pink, name: 'Pink'),
      ColorPreset(color: Colors.purple, name: 'Purple'),
      ColorPreset(color: Colors.orange, name: 'Orange'),
    ],
    this.backgroundColorLabel = 'Background color',
    this.colorLabel = 'Foreground color',
    this.actions = const [],
    this.saveButtonBuilder = defaultSaveButtonBuilder,
    this.exampleText = 'This is how your text will look.',
    this.exampleTextPlacement = ExampleTextPlacement.topCenter,
    super.key,
  });

  /// The text style settings to edit.
  final TextStyleSettings textStyleSettings;

  /// The function to call when [textStyleSettings] change.
  final ValueChanged<TextStyleSettings> onChanged;

  /// The title of the [Scaffold].
  final String title;

  /// The label for the font size slider.
  final String fontSizeLabel;

  /// The minimum allowed font size.
  final double minFontSize;

  /// The maximum allowed font size.
  final double maxFontSize;

  /// The icon to use for menu buttons.
  final IconData menuIcon;

  /// The font weight presets to use.
  final List<FontWeightPreset> fontWeightPresets;

  /// The label for the font weight [Column].
  final String fontWeightLabel;

  /// The label for the font style [Column].
  final String fontStyleLabel;

  /// The alpha label.
  final String alphaLabel;

  /// The red label.
  final String redLabel;

  /// The green label.
  final String greenLabel;

  /// The blue label.
  final String blueLabel;

  /// The color presets to use.
  final List<ColorPreset> colorPresets;

  /// The label for the background color [Row].
  final String backgroundColorLabel;

  /// The label for the color [Row].
  final String colorLabel;

  /// The actions to place in the [AppBar].
  final List<Widget> actions;

  /// The function which will build the save button.
  final Widget Function(BuildContext context, VoidCallback onPressed)
      saveButtonBuilder;

  /// The example text to show.
  final String exampleText;

  /// The placement of [exampleText].
  final ExampleTextPlacement exampleTextPlacement;

  /// Create state for this widget.
  @override
  TextStyleSettingsScreenState createState() => TextStyleSettingsScreenState();
}

/// State for [TextStyleSettingsScreen].
class TextStyleSettingsScreenState extends State<TextStyleSettingsScreen> {
  /// The text style settings to work on.
  late TextStyleSettings textStyleSettings;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    textStyleSettings = widget.textStyleSettings;
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final topPlacements = [
      ExampleTextPlacement.topLeft,
      ExampleTextPlacement.topCenter,
      ExampleTextPlacement.topRight,
    ];
    final bottomPlacements = [
      ExampleTextPlacement.bottomLeft,
      ExampleTextPlacement.bottomCenter,
      ExampleTextPlacement.bottomRight,
    ];
    FontWeightPreset? fontWeightPreset;
    for (final preset in widget.fontWeightPresets) {
      if (preset.fontWeight.value == textStyleSettings.fontWeightValue) {
        fontWeightPreset = preset;
      }
    }
    ColorPreset? backgroundColorPreset;
    ColorPreset? colorPreset;
    for (final preset in widget.colorPresets) {
      final serializableColor = preset.color.serializableColor;
      if (serializableColor.isSameAs(textStyleSettings.backgroundColorValue)) {
        backgroundColorPreset = preset;
      }
      if (serializableColor.isSameAs(textStyleSettings.colorValue)) {
        colorPreset = preset;
      }
    }
    return Scaffold(
      appBar: AppBar(
        actions: widget.actions,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (topPlacements.contains(widget.exampleTextPlacement))
              _ExampleText(
                exampleText: widget.exampleText,
                placement: widget.exampleTextPlacement,
                textStyle: textStyleSettings.textStyle,
              ),
            Row(
              children: [
                Slider(
                  value: textStyleSettings.fontSize,
                  onChanged: (final value) => setState(
                    () {
                      final fontSize = value.floor().toDouble();
                      textStyleSettings = textStyleSettings.copyWith(
                        fontSize: fontSize,
                      );
                    },
                  ),
                  autofocus: true,
                  label: widget.fontSizeLabel,
                  divisions:
                      ((widget.maxFontSize - widget.minFontSize) / 2).floor(),
                  min: widget.minFontSize,
                  max: widget.maxFontSize,
                  semanticFormatterCallback: (final value) =>
                      '${widget.fontSizeLabel} ${value.floor()}',
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.fontWeightLabel),
                    MenuAnchor(
                      menuChildren: widget.fontWeightPresets.map(
                        (final fontWeightPreset) {
                          final fontWeight = fontWeightPreset.fontWeight;
                          return MenuItemButton(
                            autofocus:
                                fontWeight == textStyleSettings.fontWeight,
                            child: Text(
                              fontWeightPreset.name,
                              style: TextStyle(fontWeight: fontWeight),
                            ),
                            onPressed: () => setState(
                              () => textStyleSettings =
                                  textStyleSettings.copyWith(
                                fontWeightValue: fontWeight.value,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                      builder: (final context, final controller, final child) =>
                          IconButton(
                        onPressed: () => _toggleController(controller),
                        icon: Icon(
                          widget.menuIcon,
                          semanticLabel: widget.fontWeightLabel,
                        ),
                        tooltip: fontWeightPreset?.name,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.fontStyleLabel),
                    MenuAnchor(
                      menuChildren: FontStyle.values
                          .map(
                            (final fontStyle) => MenuItemButton(
                              autofocus:
                                  fontStyle == textStyleSettings.fontStyle,
                              onPressed: () => setState(
                                () => textStyleSettings = textStyleSettings
                                    .copyWith(fontStyle: fontStyle),
                              ),
                              child: Text(
                                fontStyle.name,
                                style: TextStyle(fontStyle: fontStyle),
                              ),
                            ),
                          )
                          .toList(),
                      builder: (final context, final controller, final child) =>
                          IconButton(
                        onPressed: () => _toggleController(controller),
                        icon: Icon(
                          widget.menuIcon,
                          semanticLabel: widget.fontStyleLabel,
                        ),
                        tooltip: textStyleSettings.fontStyle.name,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(widget.backgroundColorLabel),
                MenuAnchor(
                  menuChildren: widget.colorPresets.map(
                    (final colorPreset) {
                      final serializableColor =
                          colorPreset.color.serializableColor;
                      return MenuItemButton(
                        autofocus: serializableColor.isSameAs(
                          textStyleSettings.backgroundColorValue,
                        ),
                        onPressed: () => setState(
                          () => textStyleSettings = textStyleSettings.copyWith(
                            backgroundColorValue: serializableColor,
                          ),
                        ),
                        child: Text(colorPreset.name),
                      );
                    },
                  ).toList(),
                  builder: (final context, final controller, final child) =>
                      IconButton(
                    onPressed: () => _toggleController(controller),
                    icon: Icon(
                      widget.menuIcon,
                      semanticLabel: widget.backgroundColorLabel,
                    ),
                    tooltip: backgroundColorPreset?.name,
                  ),
                ),
              ],
            ),
            ColorRow(
              value: textStyleSettings.backgroundColorValue,
              onChanged: (final value) => setState(
                () => textStyleSettings = textStyleSettings.copyWith(
                  backgroundColorValue: value,
                ),
              ),
              alphaLabel: widget.alphaLabel,
              redLabel: widget.redLabel,
              greenLabel: widget.greenLabel,
              blueLabel: widget.blueLabel,
            ),
            Row(
              children: [
                Text(widget.colorLabel),
                MenuAnchor(
                  menuChildren: widget.colorPresets.map(
                    (final colorPreset) {
                      final serializableColor =
                          colorPreset.color.serializableColor;
                      return MenuItemButton(
                        autofocus: serializableColor.isSameAs(
                          textStyleSettings.colorValue,
                        ),
                        onPressed: () => setState(
                          () => textStyleSettings = textStyleSettings.copyWith(
                            colorValue: serializableColor,
                          ),
                        ),
                        child: Text(colorPreset.name),
                      );
                    },
                  ).toList(),
                  builder: (final context, final controller, final child) =>
                      IconButton(
                    onPressed: () => _toggleController(controller),
                    icon: Icon(
                      widget.menuIcon,
                      semanticLabel: widget.colorLabel,
                    ),
                    tooltip: colorPreset?.name,
                  ),
                ),
              ],
            ),
            ColorRow(
              value: textStyleSettings.colorValue,
              onChanged: (final value) => setState(
                () => textStyleSettings = textStyleSettings.copyWith(
                  colorValue: value,
                ),
              ),
              alphaLabel: widget.alphaLabel,
              redLabel: widget.redLabel,
              greenLabel: widget.greenLabel,
              blueLabel: widget.blueLabel,
            ),
            if (bottomPlacements.contains(widget.exampleTextPlacement))
              _ExampleText(
                exampleText: widget.exampleText,
                placement: widget.exampleTextPlacement,
                textStyle: textStyleSettings.textStyle,
              ),
          ],
        ),
      ),
      floatingActionButton: widget.saveButtonBuilder(
        context,
        () => widget.onChanged(textStyleSettings),
      ),
    );
  }

  /// Toggle [controller].
  void _toggleController(final MenuController controller) {
    if (controller.isOpen) {
      controller.close();
    } else {
      controller.open();
    }
  }
}
