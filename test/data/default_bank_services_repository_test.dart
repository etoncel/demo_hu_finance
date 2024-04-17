import 'package:demo_hu_finance/data/default_bank_services_repository.dart';
import 'package:demo_hu_finance/data/dto/bank_service_dto.dart';
import 'package:demo_hu_finance/data/interface/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:get_it/get_it.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  GetIt getIt = GetIt.instance;

  setUp(() {
    getIt.registerFactory<ApiClient>(() => MockApiClient());
  });

  tearDown(() {
    getIt.reset();
  });

  test('should return a list of BankService when the call is successful',
      () async {
    final mockApiClient = getIt<ApiClient>();
    final repository = DefaultBankServicesRepository();
    final List<BankServiceDTO> mockServices = [
      BankServiceDTO(name: 'Servicio itau 1'),
    ];

    when(mockApiClient.getServices())
        .thenAnswer((_) async => (mockServices, null));

    final result = await repository.getServices();
    //expect(result.$2, isNull);
  });
}
