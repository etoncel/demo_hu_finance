import 'package:flutter/material.dart';

class MenuMobile extends StatelessWidget {
  final Function onAction;

  const MenuMobile({
    super.key,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(
          'Menu',
          style: textTheme.bodyMedium!.copyWith(
            color: colors.secondary,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(width: 3),
        IconButton(
          onPressed: () => onAction(),
          icon: Icon(
            Icons.menu,
            size: 24,
            color: colors.secondary,
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
