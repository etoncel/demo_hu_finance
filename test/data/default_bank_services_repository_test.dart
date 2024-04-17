import '../utils/get_it_util.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'default_bank_services_repository_test.mocks.dart';
import 'package:demo_hu_finance/data/dto/bank_service_dto.dart';
import 'package:demo_hu_finance/data/interface/api_client.dart';
import 'package:demo_hu_finance/data/default_bank_services_repository.dart';
import 'package:demo_hu_finance/domain/repositories/bank_service_repository.dart';

@GenerateMocks([ApiClient])
void main() {
  late ApiClient apiClient;
  late BanKServiceRepository repository;

  setUpAll(() {
    apiClient = MockApiClient();
    getItTest.registerFactory<ApiClient>(() => apiClient);
    repository = DefaultBankServicesRepository();
  });

  tearDownAll(() {
    if (getItTest.isRegistered<ApiClient>()) {
      getItTest.unregister<ApiClient>();
    }
  });

  test('get bankServices is empty', () async {
    final List<BankServiceDTO> services = [];

    when(apiClient.getServices())
        .thenAnswer((realInvocation) async => Future.value((services, null)));

    final result = await repository.getServices();

    expect(result.$1.isEmpty, true);
    verify(apiClient.getServices());
  });

  test('get bankServices is not empty', () async {
    final List<BankServiceDTO> services = [BankServiceDTO(name: 'pse')];

    when(apiClient.getServices())
        .thenAnswer((realInvocation) async => Future.value((services, null)));

    final result = await repository.getServices();

    expect(result.$1.isEmpty, false);
    verify(apiClient.getServices());
  });
}
