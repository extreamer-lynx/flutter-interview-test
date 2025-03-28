import 'package:flutter/material.dart';

/// A widget that shows a bottom sheet with the RGB values of the color
/// when double tapped.
class DebugBottomSheet extends StatelessWidget {
  /// The child widget to show in the bottom sheet.
  final Widget child;

  /// The color to show in the bottom sheet.
  final Color color;

  /// Creates a [DebugBottomSheet] widget.
  const DebugBottomSheet({required this.color, required this.child});

  @override
  Widget build(BuildContext context) => GestureDetector(
    child: child,
    onDoubleTap: () {
      showModalBottomSheet(
        context: context,
        builder:
            (_) => SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Debug color'),
                      const SizedBox(height: 20),
                      const Text('Color:'),
                      Text(" Red: ${color.r}"),
                      Text(" Green: ${color.g}"),
                      Text(" Blue: ${color.b}"),
                    ],
                  ),
                ),
              ),
            ),
      );
    },
  );
}
