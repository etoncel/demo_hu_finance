import 'package:flutter/material.dart';
import 'package:demo_hu_finance/presentation/ui/components/atoms/image_asset.dart';
import 'package:demo_hu_finance/presentation/ui/components/molecules/menu_mobile.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      color: colors.primary,
      child: Row(
        children: [
          // Container(
          //   key: const Key("logo_itau_image_key"),
          //   height: 40,
          //   width: 40,
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/logo_itau_white.png'),
          //     ),
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ImageAsset(
              image: 'assets/logo_itau_white.png',
              height: 40,
              width: 40,
            ),
          ),
          const Spacer(),
          MenuMobile(
            onAction: () {
              print('Open menú');
            },
          )
        ],
      ),
    );
  }
}
