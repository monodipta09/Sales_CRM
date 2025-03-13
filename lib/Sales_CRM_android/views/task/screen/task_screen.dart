import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class TaskScreen extends StatelessWidget{
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Task",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const Icon(
          IconlyLight.work,
          size: 40,
        ),
      ],
    );
  }
}