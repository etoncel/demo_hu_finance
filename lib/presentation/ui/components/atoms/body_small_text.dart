import 'package:flutter/material.dart';

class BodySmallText extends StatelessWidget {
  final String text;
  final Color color;

  const BodySmallText({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall?.copyWith(color: color);
    return Text(
      text,
      style: style,
    );
  }
}
