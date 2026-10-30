import 'package:flutter/material.dart';

/// Shows one die face (1 to 6) as an icon.
///
/// It's a StatelessWidget because it doesn't own any data: the value comes
/// from DiceScreen through the constructor, and when the value changes the
/// parent simply rebuilds it with the new value.
class Dice extends StatelessWidget {
  const Dice({super.key, required this.value});

  final int value;

  static const _faces = [
    Icons.looks_one,
    Icons.looks_two,
    Icons.looks_3,
    Icons.looks_4,
    Icons.looks_5,
    Icons.looks_6,
  ];

  @override
  Widget build(BuildContext context) {
    return Icon(
      _faces[value - 1],
      size: 110,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
