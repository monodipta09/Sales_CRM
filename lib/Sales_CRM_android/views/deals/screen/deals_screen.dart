import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DealsScreen extends StatelessWidget{
  const DealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Deals",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const Icon(
          IconlyLight.buy,
          size: 40,
        ),
      ],
    );
  }
}