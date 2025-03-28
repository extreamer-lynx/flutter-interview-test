import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_interview_app/src/components/debug_bottom_sheet.dart';

/// The home screen of the app.
/// It contains a [GestureDetector] that changes the background color
/// of the screen when tapped.
/// It also contains a [DebugBottomSheet] that shows the RGB values of the color
/// when double tapped.
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _maxIntColorValue = 4294967295;
  static const int _maxColorValueForRGB = 0xff;
  static const int _redShift = 16;
  static const int _greenShift = 8;
  static const int _blueShift = 0;

  static const int _maxColorValue = 255;
  final _random = Random();

  Color _color = Colors.white;

  /// Changes the color of the screen to a random color.
  /// Realization with calls of three _randoms.
  @Deprecated("Challange to take three int")
  void changeColor() {
    setState(() {
      _color = Color.fromRGBO(
        _random.nextInt(_maxColorValue),
        _random.nextInt(_maxColorValue),
        _random.nextInt(_maxColorValue),
        1,
      );
    });
  }

  /// Changes the color of the screen to a random color.
  /// Realization with calls of one _random.
  void _changeColorWithOneInt() {
    final int intColor = _random.nextInt(_maxIntColorValue);
    setState(() {
      _color = Color.fromRGBO(
        (intColor >> _redShift) & _maxColorValueForRGB,
        (intColor >> _greenShift) & _maxColorValueForRGB,
        (intColor >> _blueShift) & _maxColorValueForRGB,
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: DebugBottomSheet(
      color: _color,
      child: GestureDetector(
        onTap: _changeColorWithOneInt,
        child: AnimatedContainer(
          color: _color,
          duration: const Duration(milliseconds: 500),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello there',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
