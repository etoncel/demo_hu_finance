import 'package:flutter/material.dart';
import 'package:hu_basica/presentation/ui/components/atoms/body_small_text.dart';
import 'package:hu_basica/presentation/ui/components/atoms/button_small_icon.dart';

class SectionNavBarItem extends StatelessWidget {
  final IconData iconData;
  final String text;
  final bool isSelected;

  const SectionNavBarItem(
      {super.key,
      required this.iconData,
      required this.text,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = isSelected ? colorScheme.secondary : colorScheme.tertiary;
    final iconColor = isSelected ? colorScheme.secondary : colorScheme.primary;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonSmallIcon(
                iconData: iconData,
                color: iconColor,
              ),
              const SizedBox(width: 8.0),
              BodySmallText(
                text: text,
                color: textColor,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Divider(
            height: 1,
            color: colorScheme.secondary,
          ),
        )
      ],
    );
  }
}
