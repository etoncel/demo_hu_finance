import 'package:flutter/material.dart';

class BodyMediumText extends StatelessWidget {
  final String text;

  const BodyMediumText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
