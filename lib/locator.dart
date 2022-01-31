import 'package:get_it/get_it.dart';
import 'package:player/services/services.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  //locator.registerLazySingleton(() => AuthenticationService());
}
