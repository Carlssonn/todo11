import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(Luboe());
}

class Luboe extends StatefulWidget {
  const Luboe({super.key});

  @override
  State<Luboe> createState() => _MainState();
}

class _MainState extends State<Luboe> {
  int _timer = 0;
  Color _currentColor = Colors.white;

  double posX = 100;
  double posY = 300;

  final List<Color> _colors = [
    Colors.red,
    Colors.black,
    Colors.orange,
    Colors.blue,
    Colors.green,
  ];

  void _changeColor() {
    setState(() {
      _currentColor = _colors[Random().nextInt(_colors.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _currentColor,
        body: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Text('Timer $_timer second', style: TextStyle(fontSize: 24)),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _timer++;
                      });
                    },
                    child: Text('start Counting'),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: _changeColor,
                    child: Text('Change color'),
                  ),
                ],
              ),
            ),

            Positioned(
              left: posX,
              top: posY,
              child: Card(
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      posX += details.delta.dx;
                      posY += details.delta.dy;
                    });
                  },
                  onHorizontalDragUpdate: (d) {
                    _changeColor();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text('imkwel is working'),
                        Text('imkwel is working'),
                        Text('imkwel is working'),
                        Text('imkwel is working'),
                        Text('imkwel is working'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
