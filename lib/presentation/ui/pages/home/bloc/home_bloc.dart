import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hu_basica/domain/usecases/get_bank_services.dart';
import 'package:hu_basica/main.dart';
import 'package:hu_basica/presentation/ui/item_models/bank_service_item.dart';
import 'package:hu_basica/presentation/ui/pages/home/bloc/event.dart';
import 'package:hu_basica/presentation/ui/pages/home/bloc/state.dart';

class HomeBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetBankServicesUseCase getBankServicesUseCase;

  HomeBloc()
      : getBankServicesUseCase = getIt.get<GetBankServicesUseCase>(),
        super(InitialHomePageState(items: [])) {
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
