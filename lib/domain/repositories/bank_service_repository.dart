import 'package:demo_hu_finance/domain/models/bank_service.dart';

import '../../utils/failure.dart';

abstract interface class BanKServiceRepository {
  Future<(List<BanKService>, Failure?)> getServices();
}
