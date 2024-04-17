import 'package:dartz/dartz.dart';
import 'package:hu_basica/data/dto/bank_service_dto.dart';

import '../../utils/failure.dart';

abstract interface class ApiClient {
  Future<(List<BankServiceDTO>, Failure?)> getServices();
}
