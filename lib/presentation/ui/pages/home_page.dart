import 'package:flutter/material.dart';
import 'package:hu_basica/presentation/ui/components/atoms/image_asset.dart';
import 'package:hu_basica/presentation/ui/components/molecules/nav_bar.dart';
import 'package:hu_basica/presentation/ui/components/molecules/section_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: const [
        SectionNavBar(),
        NavBar(),
        ImageAsset(image: 'banner_lobby.png'),
      ],
    );
  }
}

// Home Page
// 1. Se debe consumir servicio que traiga datos de los servicios bancarios del home
// 2. Pintar los datos del servicio en la vista
// Alcance hasta el video
