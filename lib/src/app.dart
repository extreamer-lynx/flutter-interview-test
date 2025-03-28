import 'package:flutter/material.dart';
import 'package:flutter_interview_app/src/srceens/home_screen.dart';

/// The main entry point of the app.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      MaterialApp(title: 'Flutter Interview Demo', home: HomeScreen());
}
