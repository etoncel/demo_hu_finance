import 'package:dartz/dartz.dart';
import 'package:hu_basica/data/default_bank_services_repository.dart';
import 'package:hu_basica/domain/repositories/bank_service_repository.dart';
import 'package:hu_basica/domain/models/bank_service.dart';
import 'package:hu_basica/domain/use_cases/get_bank_services.dart';
import 'package:hu_basica/main.dart';
import 'package:hu_basica/utils/failure.dart';

class GetBankServicesUseCaseImpl implements GetBankServicesUseCase {
  final BanKServiceRepository _repository;

  GetBankServicesUseCaseImpl()
      : _repository = getIt.get<BanKServiceRepository>();

  @override
  Future<(List<BanKService>, Failure?)> getServices() async {
    return _repository.getServices();
  }
}
