import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hu_basica/presentation/ui/components/atoms/image_asset.dart';
import 'package:hu_basica/presentation/ui/components/molecules/nav_bar.dart';
import 'package:hu_basica/presentation/ui/components/organism/card_list.dart';
import 'package:hu_basica/presentation/ui/item_models/bank_service_item.dart';
import 'package:hu_basica/presentation/ui/components/molecules/section_nav_bar.dart';
import 'package:hu_basica/presentation/ui/pages/home/bloc/event.dart';
import 'package:hu_basica/presentation/ui/pages/home/bloc/home_bloc.dart';
import 'package:hu_basica/presentation/ui/pages/home/bloc/state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetBankServicesHomePageEvent()),
      child: BlocBuilder<HomeBloc, HomePageState>(
        builder: (context, state) {
          List<BankServiceItem> items = [];
          if (state is SuccessHomePageState) {
            items = state.items;
          }
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
                      Center(
                        child: Container(
                          transform: Matrix4.translationValues(0.0, -32.0, 0.0),
                          child: CardList(
                            items: items,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
          );
        },
      ),
    );
  }

  // Future<void> _listener(BuildContext context, HomePageState state) async {
  // if (state is LoadingHomePageLoadingState) {
//   //   // BreedLoading.show(context);
//   //   print("cargando...");
//   // } else if (state is ErrorHomePageState) {
//   //   print("error cargando la vista");
//   //   // showToast(
//   //   //   state.message,
//   //   //   backgroundColor: ProTiendasUiColors.rybBlue,
//   //   //   textStyle: const TextStyle(
//   //   //     color: Colors.white,
//   //   //   ),
//   //   // );
//   // } else if (state is SuccessHomePageState) {

//   // }
// }
}

// Home Page
// 1. Se debe consumir servicio que traiga datos de los servicios bancarios del home
// 2. Pintar los datos del servicio en la vista
// Alcance hasta el video
