import 'package:flutter/material.dart';

class ButtonSmallIcon extends StatelessWidget {
  final IconData iconData;
  final Color? color;

  const ButtonSmallIcon({super.key, required this.iconData, this.color});

  @override
  Widget build(BuildContext context) {
    final primaryColor = color ?? Theme.of(context).colorScheme.primary;
    return Icon(
      iconData,
      size: 14.0,
      color: primaryColor,
    );
  }
}
