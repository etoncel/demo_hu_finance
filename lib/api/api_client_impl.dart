import 'package:hu_basica/data/dto/bank_service_dto.dart';
import 'package:hu_basica/data/interface/api_client.dart';

import '../utils/failure.dart';

class ApiClientImpl implements ApiClient {
  @override
  Future<(List<BankServiceDTO>, Failure?)> getServices() {
    return Future.delayed(const Duration(seconds: 4), () {
      return (
        [
          BankServiceDTO(name: "Itaú Pagos Pse"),
          BankServiceDTO(name: "Cuentas Itaú"),
          BankServiceDTO(name: "Centros de atención"),
          BankServiceDTO(name: "Tarjeta de crédito"),
          BankServiceDTO(name: "Descargar Apps"),
          BankServiceDTO(name: "Crédito vivienda"),
        ],
        null,
      );
    });
  }
}
