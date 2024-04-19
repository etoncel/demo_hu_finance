import 'package:demo_hu_finance/domain/models/bank_service.dart';
import 'package:demo_hu_finance/domain/use_cases/get_bank_services.dart';
import 'package:demo_hu_finance/presentation/ui/components/molecules/section_nav_bar.dart';
import 'package:demo_hu_finance/presentation/ui/components/organism/card_list.dart';
import 'package:demo_hu_finance/presentation/ui/item_models/bank_service_item.dart';
import 'package:demo_hu_finance/presentation/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../utils/get_it_util.dart';
import 'bloc/home_bloc_test.mocks.dart';

@GenerateMocks([GetBankServicesUseCase])
void main() {
  late GetBankServicesUseCase useCase;

  // final List<BanKService> items = [
  //   BanKService(
  //     name: 'pse',
  //   )
  // ];

  setUpAll(() {
    useCase = MockGetBankServicesUseCase();
    getItTest.registerFactory<GetBankServicesUseCase>(() => useCase);
  });

  testWidgets('Section nav bar should have text', (tester) async {
    const sectionNavBar = MaterialApp(home: SectionNavBar());

    await tester.pumpWidget(sectionNavBar);

    expect(find.byType(SectionNavBar), findsOneWidget);

    expect(find.text("Personas"), findsOne);
    expect(find.text("Corporate"), findsOne);
  });

  // testWidgets('Get card lists', (tester) async {
  //   // when(useCase.getServices()).thenAnswer((_) async {
  //   //   return Future.value((items, null));
  //   // });

  //   // Convocar el widget
  //   const homePage = MaterialApp(
  //     home: HomePage(),
  //   );
  //   await tester.pumpWidget(
  //     homePage,
  //     Duration(seconds: 6),
  //   );

  //   final titlePersonFinder = find.text("Personas");

  //   expect(titlePersonFinder, findsOne);

  //   // final cardListFinder = find.byType(CardList);

  //   // expect(cardListFinder, findsAtLeast(1));
  // });
}
