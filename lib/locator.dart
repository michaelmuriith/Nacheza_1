import 'package:Gamegig/services/navigation_service/navigation_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  //locator.registerLazySingleton(() => AuthenticationService());
}
