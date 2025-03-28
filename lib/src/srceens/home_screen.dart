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
  final _random = Random();
  final _maxColorValue = 256;
  Color _color = Colors.white;

  void _changeColor() {
    setState(() {
      _color = Color.fromRGBO(
        _random.nextInt(_maxColorValue),
        _random.nextInt(_maxColorValue),
        _random.nextInt(_maxColorValue),
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: DebugBottomSheet(
      color: _color,
      child: GestureDetector(
        onTap: _changeColor,
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
