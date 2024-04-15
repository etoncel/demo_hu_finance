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
    final width = MediaQuery.of(context).size.width;
    var wrap = Wrap(
      alignment: WrapAlignment.center,
      children: List.generate(6, (index) => CustomCard(item: items[0])),
    );
    switch (width) {
      case > 700 && < 1200:
        return SizedBox(
          width: 704,
          child: wrap,
        );
      default:
        return wrap;
    }
  }
}
