import 'package:flutter/material.dart';
import '../../item_models/bank_service_item.dart';
import 'package:demo_hu_finance/presentation/ui/components/atoms/card_icon.dart';
import 'package:demo_hu_finance/presentation/ui/components/atoms/body_medium_text.dart';
import 'package:demo_hu_finance/presentation/ui/components/atoms/button_small_icon.dart';

class CustomCard extends StatefulWidget {
  final BankServiceItem item;

  const CustomCard({
    super.key,
    required this.item,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHover = true),
        onExit: (_) => setState(() => isHover = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          transform: Matrix4.translationValues(
            0,
            (isHover && width >= 1200) ? -15 : 0,
            0,
          ),
          child: _BodyCard(isHover: isHover, widget: widget),
        ),
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  const _BodyCard({
    required this.isHover,
    required this.widget,
  });

  final bool isHover;
  final CustomCard widget;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 144,
      height: 144,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: (isHover && width >= 1200) ? 4 : null,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardIcon(iconData: widget.item.iconData),
              const SizedBox(
                height: 12.0,
              ),
              Expanded(
                child: BodyMediumText(text: widget.item.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
