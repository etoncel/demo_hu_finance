import 'package:hu_basica/domain/models/bank_service.dart';

import '../../utils/failure.dart';

abstract interface class BanKServiceRepository {
  Future<(List<BanKService>, Failure?)> getServices();
}
