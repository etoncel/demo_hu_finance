import 'package:flutter/material.dart';
import 'package:demo_hu_finance/presentation/ui/components/molecules/card.dart';
import 'package:demo_hu_finance/presentation/ui/item_models/bank_service_item.dart';

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
      children: List.generate(
          items.length,
          (index) => GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                    "/service_detail",
                  ),
              child: CustomCard(item: items[index]))),
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
