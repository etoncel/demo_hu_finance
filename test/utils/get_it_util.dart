import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class GetItUtil {
  static void registerDependency<T>() {
    getIt.registerFactory(() => T);
  }

  static void unRegisterDependency<T>() {
    getIt.unregister();
  }
}
