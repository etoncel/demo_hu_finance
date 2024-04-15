import 'package:flutter/material.dart';
import 'package:hu_basica/ui/components/molecules/card.dart';
import 'package:hu_basica/ui/components/molecules/section_nav_bar.dart';
import 'package:hu_basica/ui/item_models/bank_service_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CustomCard(
        //     item: BankServiceItem(
        //         name: "Pagos pse", iconData: Icons.abc, destination: ""))
        SectionNavBar()
      ],
    );
  }
}

// Home Page
// 1. Se debe consumir servicio que traiga datos de los servicios bancarios del home
// 2. Pintar los datos del servicio en la vista
// Alcance hasta el video
