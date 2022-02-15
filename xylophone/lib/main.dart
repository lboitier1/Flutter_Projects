import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({int playNumber, Color color}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          playSound(playNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(playNumber: 1, color: Colors.red),
              buildKey(playNumber: 2, color: Colors.orange),
              buildKey(playNumber: 3, color: Colors.yellow),
              buildKey(playNumber: 4, color: Colors.green),
              buildKey(playNumber: 5, color: Colors.teal),
              buildKey(playNumber: 6, color: Colors.blue),
              buildKey(playNumber: 7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
