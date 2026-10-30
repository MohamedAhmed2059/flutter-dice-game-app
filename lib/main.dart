import 'dart:math';

import 'package:flutter/material.dart';

import 'dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Play Dice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: const DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  static const _happyImage = 'assets/images/happy.png';
  static const _sadImage = 'assets/images/sad.png';

  final _random = Random();

  int _dice1 = 1;
  int _dice2 = 1;
  String _imagePath = _sadImage;

  int get _total => _dice1 + _dice2;

  // The task says "10 or more" wins, so a total of 10, 11 or 12 is a win.
  bool get _isWin => _total >= 10;

  void _roll() {
    setState(() {
      _dice1 = _random.nextInt(6) + 1;
      _dice2 = _random.nextInt(6) + 1;
      _imagePath = _isWin ? _happyImage : _sadImage;
    });
  }

  void _reset() {
    setState(() {
      _dice1 = 1;
      _dice2 = 1;
      _imagePath = _sadImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      foregroundColor: Colors.yellow,
    );

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.casino),
        title: const Text('Play Dice'),
        centerTitle: true,
        backgroundColor: colors.primaryContainer,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Total is $_total', style: textTheme.titleLarge),
            ),
            Expanded(
              child: Center(
                child: Image.asset(_imagePath, height: 220),
              ),
            ),
            Text(
              _isWin ? 'You Win' : 'You Lose',
              style: textTheme.headlineSmall?.copyWith(
                color: _isWin ? Colors.greenAccent : Colors.redAccent,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Dice(value: _dice1),
                Dice(value: _dice2),
              ],
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: _roll,
                      child: const Text('roll'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: _reset,
                      child: const Text('reset'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
