import 'package:hu_basica/api/api_client_impl.dart';
import 'package:hu_basica/data/interface/api_client.dart';
import 'package:hu_basica/domain/repositories/bank_service_repository.dart';
import 'package:hu_basica/domain/models/bank_service.dart';
import 'package:hu_basica/main.dart';

import '../utils/failure.dart';

class DefaultBankServicesRepository implements BanKServiceRepository {
  final ApiClient _apiClient;

  DefaultBankServicesRepository() : _apiClient = getIt.get<ApiClientImpl>();

  @override
  Future<(List<BanKService>, Failure?)> getServices() async {
    final response = await _apiClient.getServices();
    return (
      response.$1.map((service) => BanKService(name: service.name)).toList(),
      null
    );
  }
}
