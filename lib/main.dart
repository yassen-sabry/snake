
import 'package:flutter/material.dart';

import 'gamefield.dart';

void main() {
  runApp(SnakeGame());
}

class SnakeGame extends StatelessWidget {
  const SnakeGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameField(),
      debugShowCheckedModeBanner: false,
    );
  }
}



