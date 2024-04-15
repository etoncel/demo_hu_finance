import 'package:flutter/material.dart';
import 'package:hu_basica/ui/components/atoms/body_medium_text.dart';
import 'package:hu_basica/ui/components/atoms/button_small_icon.dart';
import 'package:hu_basica/ui/components/atoms/card_icon.dart';

import '../../item_models/bank_service_item.dart';

class CustomCard extends StatelessWidget {
  final BankServiceItem item;

  const CustomCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 144,
      height: 144,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardIcon(iconData: item.iconData),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                children: [
                  BodyMediumText(text: item.name),
                  const ButtonSmallIcon(
                    iconData: Icons.arrow_forward_ios,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
