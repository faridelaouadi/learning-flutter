import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Widget buildKeys({int buttonNumber, Color colour}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playSound(buttonNumber);
        },
        color: colour,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKeys(buttonNumber: 1, colour: Colors.red),
              buildKeys(buttonNumber: 2, colour: Colors.orange),
              buildKeys(buttonNumber: 3, colour: Colors.blue),
              buildKeys(buttonNumber: 4, colour: Colors.green),
              buildKeys(buttonNumber: 5, colour: Colors.greenAccent),
              buildKeys(buttonNumber: 6, colour: Colors.yellow),
              buildKeys(buttonNumber: 7, colour: Colors.pink),
            ],
          ),
        ),
      ),
    );
  }
}
