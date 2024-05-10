import 'package:get_it/get_it.dart';
import 'package:demo_hu_finance/api/api_client_impl.dart';
import 'package:demo_hu_finance/data/default_bank_services_repository.dart';
import 'package:demo_hu_finance/data/interface/api_client.dart';
import 'package:demo_hu_finance/domain/repositories/bank_service_repository.dart';
import 'package:demo_hu_finance/domain/use_cases/get_bank_services.dart';
import 'package:demo_hu_finance/domain/use_cases/get_bank_services_impl.dart';

GetIt getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerFactory<ApiClient>(() => ApiClientImpl());

  getIt.registerFactory<BanKServiceRepository>(
      () => DefaultBankServicesRepository());

  getIt.registerFactory<GetBankServicesUseCase>(
    () => GetBankServicesUseCaseImpl(),
  );
}
