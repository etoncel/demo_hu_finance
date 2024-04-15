import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hu_basica/presentation/ui/components/molecules/section_nav_bar_item.dart';

class SectionNavBar extends StatelessWidget {
  const SectionNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 32,
              color: colorScheme.primary,
              child: const SectionNavBarItem(
                iconData: Icons.person,
                text: "Personas",
                isSelected: true,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 32,
              color: colorScheme.secondary,
              child: const SectionNavBarItem(
                iconData: Icons.mobile_off_outlined,
                text: "Corporate",
                isSelected: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
