import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_text_style_settings/flutter_text_style_settings.dart';
import 'package:recase/recase.dart';

const _encoder = JsonEncoder.withIndent('  ');
void main() {
  runApp(const MyApp());
}

/// The top-level app class.
class MyApp extends StatelessWidget {
  /// Create an instance.
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      );
}

/// The home screen for this application.
class HomeScreen extends StatefulWidget {
  /// Create an instance.
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// The placement for the example text.
  late ExampleTextPlacement exampleTextPlacement;

  /// The default text style settings.
  TextStyleSettings? _textStyleSettings;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    if (!RendererBinding.instance.semanticsEnabled) {
      RendererBinding.instance.ensureSemantics();
    }
    exampleTextPlacement = ExampleTextPlacement.topCenter;
  }

  /// Build the widget.
  @override
  Widget build(final BuildContext context) {
    final TextStyleSettings settings;
    final textStyleSettings = _textStyleSettings;
    if (textStyleSettings == null) {
      settings = TextStyleSettings.from(context);
      _textStyleSettings = settings;
    } else {
      settings = textStyleSettings;
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          MenuAnchor(
            menuChildren: ExampleTextPlacement.values
                .map(
                  (final placement) => MenuItemButton(
                    autofocus: placement == exampleTextPlacement,
                    child: Text(placement.name.titleCase),
                    onPressed: () => setState(
                      () => exampleTextPlacement = placement,
                    ),
                  ),
                )
                .toList(),
            builder: (final context, final controller, final child) =>
                IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: const Icon(Icons.more_vert),
              tooltip: 'Move example text',
            ),
          ),
          IconButton(
            onPressed: () => setState(() => _textStyleSettings = null),
            icon: const Icon(Icons.undo),
            tooltip: 'Reset to defaults',
          ),
        ],
        title: const Text('Edit Text Style'),
      ),
      body: TextStyleSettingsPage(
        textStyleSettings: settings,
        onChanged: (final value) {
          final string = _encoder.convert(value);
          Clipboard.setData(ClipboardData(text: string));
          setState(() => _textStyleSettings = value);
        },
        key: ValueKey('${settings.toJson()} $exampleTextPlacement'),
        exampleTextPlacement: exampleTextPlacement,
        backgroundColorLabel: 'Background colour',
        colorLabel: 'Foreground colour',
      ),
    );
  }
}
