import 'package:flutter/material.dart';
import 'package:hu_basica/presentation/ui/components/atoms/image_asset.dart';
import 'package:hu_basica/presentation/ui/components/molecules/nav_bar.dart';
import 'package:hu_basica/presentation/ui/components/organism/card_list.dart';
import 'package:hu_basica/presentation/ui/item_models/bank_service_item.dart';
import 'package:hu_basica/presentation/ui/components/molecules/section_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const SectionNavBar(),
          const NavBar(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                const ImageAsset(image: 'banner_lobby.png'),
                CardList(items: [
                  BankServiceItem(
                      name: 'Pago con PSE',
                      iconData: Icons.attach_money,
                      destination: '')
                ])
              ],
            ),
          ),
        ],
      )),
    );
  }
}

// Home Page
// 1. Se debe consumir servicio que traiga datos de los servicios bancarios del home
// 2. Pintar los datos del servicio en la vista
// Alcance hasta el video
