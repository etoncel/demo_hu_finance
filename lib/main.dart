import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hu_basica/api/api_client_impl.dart';
import 'package:hu_basica/data/default_bank_services_repository.dart';
import 'package:hu_basica/data/interface/api_client.dart';
import 'package:hu_basica/domain/repositories/bank_service_repository.dart';
import 'package:hu_basica/domain/usecases/get_bank_services.dart';
import 'package:hu_basica/domain/usecases/get_bank_services_impl.dart';
import 'presentation/ui/pages/home/home_page.dart';
import 'package:hu_basica/config/theme/app_theme.dart';

GetIt getIt = GetIt.instance;
void main() {
  getIt.registerFactory<ApiClient>(() => ApiClientImpl());

  getIt.registerFactory<BanKServiceRepository>(
      () => DefaultBankServicesRepository());

  getIt.registerFactory<GetBankServicesUseCase>(
    () => GetBankServicesUseCaseImpl(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData,
      home: const HomePage(),
    );
  }
}
