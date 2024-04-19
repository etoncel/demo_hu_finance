import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demo_hu_finance/presentation/ui/pages/home/bloc/state.dart';
import 'package:demo_hu_finance/presentation/ui/pages/home/bloc/event.dart';
import 'package:demo_hu_finance/presentation/ui/pages/home/bloc/home_bloc.dart';
import 'package:demo_hu_finance/presentation/ui/components/atoms/image_asset.dart';
import 'package:demo_hu_finance/presentation/ui/components/molecules/nav_bar.dart';
import 'package:demo_hu_finance/presentation/ui/components/organism/card_list.dart';
import 'package:demo_hu_finance/presentation/ui/item_models/bank_service_item.dart';
import 'package:demo_hu_finance/presentation/ui/components/molecules/section_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = HomeBloc();
    return BlocProvider(
      create: (context) => bloc..add(GetBankServicesHomePageEvent()),
      child: BlocConsumer<HomeBloc, HomePageState>(builder: (context, state) {
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
                    _CardsWidget(
                        isLoading: state is LoadingHomePageLoadingState,
                        items: items)
                  ],
                ),
              ),
            ],
          )),
        );
      }, listener: (context, state) {
        if (state is ErrorHomePageState) {
          _openErrorDialog(context, state.message);
        }
      }),
    );
  }

  void _openErrorDialog(
    BuildContext context,
    String errorMessage,
  ) {
    showDialog(
        context: context,
        builder: (builderContext) {
          return AlertDialog(
            title: const Text("Ha ocurrido un error",
                style: TextStyle(fontSize: 20.0)),
            content: Text(
              errorMessage,
              style: const TextStyle(fontSize: 12.0),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(builderContext).pop();
                  },
                  child: const Text("Cerrar"))
            ],
          );
        });
  }
}

class _CardsWidget extends StatelessWidget {
  final bool isLoading;
  final List<BankServiceItem> items;

  const _CardsWidget({
    required this.isLoading,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return isLoading
        ? const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(),
              ),
            ),
          )
        : Center(
            child: Container(
              transform: Matrix4.translationValues(
                  0.0, width > 552 ? -28.0 : 0.0, 0.0),
              child: CardList(
                items: items,
              ),
            ),
          );
  }
}

// Home Page
// 1. Se debe consumir servicio que traiga datos de los servicios bancarios del home
// 2. Pintar los datos del servicio en la vista
// Alcance hasta el video
