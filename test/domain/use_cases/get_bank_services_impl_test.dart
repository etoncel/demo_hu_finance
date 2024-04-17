import 'package:demo_hu_finance/domain/models/bank_service.dart';
import 'package:demo_hu_finance/domain/repositories/bank_service_repository.dart';
import 'package:demo_hu_finance/domain/use_cases/get_bank_services.dart';
import 'package:demo_hu_finance/domain/use_cases/get_bank_services_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_bank_services_impl_test.mocks.dart';

@GenerateMocks([BanKServiceRepository])
void main() {
  late BanKServiceRepository repository;

  setUpAll(() {
    repository = MockBanKServiceRepository();
    GetIt.I.registerFactory(() => repository);
  });

  tearDownAll(() {
    if (GetIt.I.isRegistered<BanKServiceRepository>()) {
      GetIt.I.unregister<BanKServiceRepository>();
    }
  });

  test('get bankServices is empty', () async {
    final List<BanKService> services = [];
    final GetBankServicesUseCase useCase = GetBankServicesUseCaseImpl();

    when(repository.getServices())
        .thenAnswer((realInvocation) async => Future.value((services, null)));

    final result = await useCase.getServices();

    expect(result.$1.isEmpty, true);
    verify(repository.getServices());
  });

  test('get bankServices is not empty', () async {
    final List<BanKService> services = [BanKService(name: 'pse')];
    final GetBankServicesUseCase useCase = GetBankServicesUseCaseImpl();

    when(repository.getServices())
        .thenAnswer((realInvocation) async => Future.value((services, null)));

    final result = await useCase.getServices();

    expect(result.$1.isEmpty, false);
    verify(repository.getServices());
  });
}
