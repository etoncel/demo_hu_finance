import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demo_hu_finance/helper/get_it_injection.dart';
import 'package:demo_hu_finance/domain/use_cases/get_bank_services.dart';
import 'package:demo_hu_finance/presentation/ui/pages/home/bloc/event.dart';
import 'package:demo_hu_finance/presentation/ui/pages/home/bloc/state.dart';
import 'package:demo_hu_finance/presentation/ui/item_models/bank_service_item.dart';

class HomeBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetBankServicesUseCase getBankServicesUseCase;

  HomeBloc()
      : getBankServicesUseCase = getIt.get<GetBankServicesUseCase>(),
        super(InitialHomePageState()) {
    on<GetBankServicesHomePageEvent>(
      (event, emit) async {
        final response = await getBankServicesUseCase.getServices();
        if (response.$1.isNotEmpty) {
          emit(
            SuccessHomePageState(
                items: response.$1
                    .map(
                      (service) => BankServiceItem(
                          name: service.name,
                          iconData: Icons.attach_money,
                          destination: "destination"),
                    )
                    .toList()),
          );
        }
      },
    );
  }
}
