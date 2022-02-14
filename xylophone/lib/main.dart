import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[400],
        body: SafeArea(
          child: Container(
            child: Center(
              child: TextButton(
                child: Text('Tap to play'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  final player = AudioCache();
                  player.play("note1.wav");
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
