import 'package:bloc_test/bloc_test.dart';
import 'package:demo_hu_finance/domain/models/bank_service.dart';
import 'package:demo_hu_finance/domain/use_cases/get_bank_services.dart';
import 'package:demo_hu_finance/presentation/ui/item_models/bank_service_item.dart';
import 'package:demo_hu_finance/presentation/ui/pages/home/bloc/event.dart';
import 'package:demo_hu_finance/presentation/ui/pages/home/bloc/home_bloc.dart';
import 'package:demo_hu_finance/presentation/ui/pages/home/bloc/state.dart';
import 'package:demo_hu_finance/utils/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../utils/get_it_util.dart';
import 'home_bloc_test.mocks.dart';

@GenerateMocks([GetBankServicesUseCase])
void main() {
  late GetBankServicesUseCase useCase;
  late HomeBloc sut;

  final List<BankServiceItem> items = [
    const BankServiceItem(
        name: 'pse', iconData: Icons.attach_money, destination: "destination")
  ];

  setUpAll(() {
    useCase = MockGetBankServicesUseCase();
    getItTest.registerFactory<GetBankServicesUseCase>(() => useCase);
    sut = HomeBloc();
  });

  tearDownAll(() {
    if (getItTest.isRegistered<GetBankServicesUseCase>()) {
      getItTest.unregister<GetBankServicesUseCase>();
    }
  });

  test('initial state is list empty', () {
    expect(sut.state, isA<HomePageState>());
  });

  blocTest<HomeBloc, HomePageState>(
      'success state where bloc emits list of BankServiceItems',
      build: () {
        final List<BanKService> services = [BanKService(name: 'pse')];
        when(useCase.getServices()).thenAnswer((_) async {
          return Future.value((services, null));
        });
        return sut;
      },
      act: (bloc) => bloc.add(GetBankServicesHomePageEvent()),
      expect: () =>
          [LoadingHomePageLoadingState(), SuccessHomePageState(items: items)]);

  blocTest<HomeBloc, HomePageState>('error state',
      build: () {
        when(useCase.getServices()).thenAnswer((_) async {
          return Future.value((List<BanKService>.of([]), Failure("error")));
        });
        return sut;
      },
      act: (bloc) => bloc.add(GetBankServicesHomePageEvent()),
      expect: () => [
            LoadingHomePageLoadingState(),
            ErrorHomePageState(message: "error")
          ]);
}
