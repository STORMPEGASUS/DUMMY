import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Widget buildkey({int n, Color color}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          final player = AudioCache();
          player.play('note$n.wav');
        },
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text('XYLOPHONE'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildkey(n: 1, color: Colors.red),
              buildkey(n: 2, color: Colors.orange),
              buildkey(n: 3, color: Colors.yellow),
              buildkey(n: 4, color: Colors.green),
              buildkey(n: 5, color: Colors.lightGreen),
              buildkey(n: 6, color: Colors.indigo),
              buildkey(n: 7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
