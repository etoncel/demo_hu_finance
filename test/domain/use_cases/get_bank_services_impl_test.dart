import 'package:demo_hu_finance/domain/models/bank_service.dart';
import 'package:demo_hu_finance/domain/repositories/bank_service_repository.dart';
import 'package:demo_hu_finance/domain/use_cases/get_bank_services_impl.dart';
import 'package:demo_hu_finance/utils/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:get_it/get_it.dart';

class MockBankServiceRepository extends Mock implements BanKServiceRepository {}

void main() {
  GetIt getIt = GetIt.instance;

  setUp(() {
    getIt.registerFactory<BanKServiceRepository>(
        () => MockBankServiceRepository());
  });

  tearDown(() {
    getIt.reset();
  });

  test('getServices', () async {
    final mockRepository = getIt<BanKServiceRepository>();
    final useCase = GetBankServicesUseCaseImpl();
    final Failure mockFailure = Failure('Error');

    when(mockRepository.getServices()).thenAnswer((_) async {
      return ([BanKService(name: "pse")], null);
    });

    final result = await useCase.getServices();

    expect(result.$1.isEmpty, false);
    verify(mockRepository.getServices()).called(1);
  });
}
