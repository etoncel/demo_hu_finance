import 'dart:math';

import 'package:demo_hu_finance/data/dto/bank_service_dto.dart';
import 'package:demo_hu_finance/data/interface/api_client.dart';

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
    // var random = Random();

    // if (random.nextInt(2) == 1) {
    //   return Future.delayed(const Duration(seconds: 4), () {
    //     return (
    //       [
    //         BankServiceDTO(name: "Itaú Pagos Pse"),
    //         BankServiceDTO(name: "Cuentas Itaú"),
    //         BankServiceDTO(name: "Centros de atención"),
    //         BankServiceDTO(name: "Tarjeta de crédito"),
    //         BankServiceDTO(name: "Descargar Apps"),
    //         BankServiceDTO(name: "Crédito vivienda"),
    //       ],
    //       null,
    //     );
    //   });
    // } else {
    //   return Future.delayed(
    //     const Duration(seconds: 4),
    //     () => (
    //       List<BankServiceDTO>.of([]),
    //       Failure("error en el servicio"),
    //     ),
    //   );
    // }
  }
}
