import 'package:demo_hu_finance/presentation/ui/components/molecules/card.dart';
import 'package:demo_hu_finance/presentation/ui/pages/home/home_page.dart';
import 'package:demo_hu_finance/presentation/ui/pages/service_detail/service_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:demo_hu_finance/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Navigates to a service detail from home and return',
      (tester) async {
    app.main();

    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);

    final cardFinder = find.byType(CustomCard);

    expect(cardFinder, findsAtLeast(2));

    await tester.tap(cardFinder.first);

    await tester.pumpAndSettle();

    expect(find.byType(ServiceDetailPage), findsOneWidget);

    await tester.tap(find.byKey(const Key("goBackArrowKey")));

    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
  });
}
