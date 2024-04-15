import 'package:flutter/material.dart';

class CardIcon extends StatelessWidget {
  final IconData iconData;

  const CardIcon({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Icon(
      iconData,
      size: 40.0,
      color: primaryColor,
    );
  }
}
