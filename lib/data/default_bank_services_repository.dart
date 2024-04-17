import 'package:demo_hu_finance/data/interface/api_client.dart';
import 'package:demo_hu_finance/domain/repositories/bank_service_repository.dart';
import 'package:demo_hu_finance/domain/models/bank_service.dart';
import 'package:demo_hu_finance/helper/get_it_injection.dart';

import '../utils/failure.dart';

class DefaultBankServicesRepository implements BanKServiceRepository {
  final ApiClient _apiClient;

  DefaultBankServicesRepository() : _apiClient = getIt.get<ApiClient>();

  @override
  Future<(List<BanKService>, Failure?)> getServices() async {
    final response = await _apiClient.getServices();
    return (
      response.$1.map((service) => BanKService(name: service.name)).toList(),
      null
    );
  }
}
