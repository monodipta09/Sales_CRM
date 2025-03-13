import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AccountScreen extends StatelessWidget{
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Account",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const Icon(
          IconlyLight.activity,
          size: 40,
        ),
      ],
    );
  }
}