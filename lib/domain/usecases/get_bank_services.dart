import '../../utils/failure.dart';
import '../models/bank_service.dart';

abstract interface class GetBankServicesUseCase {
  Future<(List<BanKService>, Failure?)> getServices();
}
