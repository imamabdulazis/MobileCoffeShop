

import 'package:caffeshop/component/constants/share_preference.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  SharedPreferencesManager sharedPreferencesManager =
      await SharedPreferencesManager.getInstance();
  locator.registerSingleton<SharedPreferencesManager>(sharedPreferencesManager);
  // locator.registerLazySingleton(() => DialogService());
  // locator.registerLazySingleton(() => NavigationService());
  // locator.registerLazySingleton(() => PushNotificationService());
}
