import 'package:demo_hu_finance/domain/repositories/bank_service_repository.dart';
import 'package:demo_hu_finance/domain/models/bank_service.dart';
import 'package:demo_hu_finance/domain/use_cases/get_bank_services.dart';
import 'package:demo_hu_finance/helper/get_it_injection.dart';
import 'package:demo_hu_finance/utils/failure.dart';

class GetBankServicesUseCaseImpl implements GetBankServicesUseCase {
  final BanKServiceRepository _repository;

  GetBankServicesUseCaseImpl()
      : _repository = getIt.get<BanKServiceRepository>();

  @override
  Future<(List<BanKService>, Failure?)> getServices() async {
    return _repository.getServices();
  }
}
