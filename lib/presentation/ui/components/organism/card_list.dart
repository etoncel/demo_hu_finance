import 'package:flutter/material.dart';
import 'package:hu_basica/presentation/ui/components/molecules/card.dart';
import 'package:hu_basica/presentation/ui/item_models/bank_service_item.dart';

class CardList extends StatelessWidget {
  final List<BankServiceItem> items;

  const CardList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
          items.length, (index) => CustomCard(item: items[index])),
    );
  }
}
