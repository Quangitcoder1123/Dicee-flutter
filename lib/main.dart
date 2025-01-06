import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            "Dicee",
          ),
          centerTitle: true,
        ),
        body: const DiceePage(),
      ),
    );
  }
}

class DiceePage extends StatefulWidget {
  const DiceePage({super.key});

  @override
  State<DiceePage> createState() => _DiceePageState();
}

class _DiceePageState extends State<DiceePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1; // Random từ 1 đến 6
      rightDiceNumber = Random().nextInt(6) + 1; // Random từ 1 đến 6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: IconButton(
            padding: const EdgeInsets.all(16),
            splashColor: Colors.transparent,
            splashRadius: 0.1,
            onPressed: () {
              changeDice(); // Khi bấm sẽ thay đổi cả hai ảnh xúc xắc
            },
            icon: Image.asset(
              "images/dice$leftDiceNumber.png",
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              changeDice();
            },
            padding: const EdgeInsets.all(16),
            splashColor: Colors.transparent,
            splashRadius: 0.1,
            icon: Image.asset(
              'images/dice$rightDiceNumber.png',
            ),
          ),
        ),
      ],
    );
  }
}
