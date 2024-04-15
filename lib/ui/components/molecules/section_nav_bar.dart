import 'package:flutter/material.dart';
import 'package:hu_basica/ui/components/molecules/section_nav_bar_item.dart';

class SectionNavBar extends StatelessWidget {
  const SectionNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          color: colorScheme.primary,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: SectionNavBarItem(
            iconData: Icons.person,
            text: "Personas",
            isSelected: true,
          ),
        ),
        SectionNavBarItem(
          iconData: Icons.mobile_off_outlined,
          text: "Corporate",
          isSelected: false,
        ),
      ],
    );
  }
}
