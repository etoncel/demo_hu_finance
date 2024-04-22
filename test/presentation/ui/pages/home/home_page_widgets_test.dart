import 'package:demo_hu_finance/domain/models/bank_service.dart';
import 'package:demo_hu_finance/domain/use_cases/get_bank_services.dart';
import 'package:demo_hu_finance/presentation/ui/components/atoms/image_asset.dart';
import 'package:demo_hu_finance/presentation/ui/components/molecules/card.dart';
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
  TestWidgetsFlutterBinding.ensureInitialized();
  late GetBankServicesUseCase useCase;

  final List<BanKService> items = [
    BanKService(
      name: 'pse',
    ),
    BanKService(
      name: 'pago fisico',
    ),
    BanKService(
      name: 'servicio',
    )
  ];

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

  testWidgets('Get card lists', (tester) async {
    when(useCase.getServices()).thenAnswer((_) async {
      return Future.value((items, null));
    });

    // Convocar el widget
    const homePage = MaterialApp(
      home: HomePage(),
    );

    await tester.pumpWidget(homePage);
    // await tester.runAsync(() async {

    // });
    // Element element =
    // tester.element(find.byKey(const Key("logo_itau_image_key")));
    // Element element = tester.element(find.byType(DecoratedBox).first);
    // DecoratedBox widget = element.widget as DecoratedBox;
    // BoxDecoration decoration = widget.decoration as BoxDecoration;
    // if (decoration.image?.image != null) {
    //   await precacheImage(decoration.image!.image, element);
    // }

    await tester.pumpAndSettle();

    int cardCounter = 0;

    for (final item in items) {
      // final cardItemFinder = find.byType(CustomCard);
      // final card = cardItemFinder.evaluate().first.widget as CustomCard;
      // print("::::::CARD ${card.item}");
      final cardItemFinder = find.text(item.name);

      await tester.ensureVisible(cardItemFinder);
      expect(cardItemFinder, findsOneWidget);
      cardCounter++;
    }

    expect(cardCounter, equals(2));
  });

  testWidgets('Test custom card', (tester) async {
    const card = MaterialApp(
      home: CustomCard(
          item: BankServiceItem(
              name: "Netflix",
              iconData: Icons.money_off,
              destination: "netflix page")),
    );

    await tester.pumpWidget(card);

    final cardItemFinder = find.text("Netflix");

    // await tester.ensureVisible(cardItemFinder);
    expect(cardItemFinder, findsOneWidget);
  });
}
