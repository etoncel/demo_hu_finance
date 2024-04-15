import 'package:flutter/material.dart';
import 'package:hu_basica/presentation/ui/components/molecules/section_nav_bar_item.dart';

class SectionNavBar extends StatelessWidget {
  const SectionNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        item(
          color: colorScheme.primary,
          parentWidth: size.width,
          name: 'Personas',
          icon: Icons.person,
        ),
        item(
          color: colorScheme.secondary,
          parentWidth: size.width,
          name: 'Corporate',
          icon: Icons.person,
          isSelected: false,
        )
      ],
    );
  }

  Widget item({
    required Color color,
    required double parentWidth,
    required String name,
    required IconData icon,
    bool isSelected = true,
  }) {
    final item = Container(
      height: 32,
      width: 180,
      color: color,
      child: SectionNavBarItem(
        iconData: icon,
        text: name,
        isSelected: isSelected,
      ),
    );

    return (parentWidth > 1000) ? item : Expanded(child: item);
  }
}
