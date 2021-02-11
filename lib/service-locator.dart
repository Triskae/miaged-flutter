import 'package:Miaged/services/abastraction/auth-service-abstraction.dart';
import 'package:Miaged/services/auth-service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<AuthServiceAbstraction>(() => AuthService());
}