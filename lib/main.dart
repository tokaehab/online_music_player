import 'package:flutter/material.dart';
import 'package:online_music_player/screens/explore_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: ExploreScreen(),
    );
  }
}
