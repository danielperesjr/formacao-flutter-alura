import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int taskDifficulty;

  const Difficulty({
    required this.taskDifficulty,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
            Icons.star,
            size: 15,
            color: (taskDifficulty >= 1) ? Colors.blue : Colors.blue[100]),
        Icon(
            Icons.star,
            size: 15,
            color: (taskDifficulty >= 2) ? Colors.blue : Colors.blue[100]),
        Icon(
            Icons.star,
            size: 15,
            color: (taskDifficulty >= 3) ? Colors.blue : Colors.blue[100]),
        Icon(
            Icons.star,
            size: 15,
            color: (taskDifficulty >= 4) ? Colors.blue : Colors.blue[100]),
        Icon(
            Icons.star,
            size: 15,
            color: (taskDifficulty >= 5) ? Colors.blue : Colors.blue[100]),
      ],
    );
  }
}