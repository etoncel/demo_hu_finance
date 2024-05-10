import 'package:demo_hu_finance/data/dto/bank_service_dto.dart';

import '../../utils/failure.dart';

abstract interface class ApiClient {
  Future<(List<BankServiceDTO>, Failure?)> getServices();
}
