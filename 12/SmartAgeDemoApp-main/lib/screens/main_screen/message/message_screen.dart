import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Coming Soon",
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
