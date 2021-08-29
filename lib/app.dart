import 'package:caffeshop/component/constants/share_preference.dart';
import 'package:caffeshop/component/utils/injector.dart';
import 'package:caffeshop/component/utils/notification.dart';
import 'package:caffeshop/data/utils/dynamic_link.dart';
import 'package:caffeshop/presentations/screens/kasir/kasir.dart';
import 'package:caffeshop/presentations/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentations/screens/drawer/drawer_navigation.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final prefs = locator<SharedPreferencesManager>();

  final NotificationService notificationService = NotificationService();
  final DynamicLinkService dynamicLinkService = DynamicLinkService();

  @override
  void initState() {
    super.initState();
    notificationService.initialize();
    dynamicLinkService.handleDynamicLinks();
  }

  @override
  Widget build(BuildContext context) {
    final isLogin = prefs.isKeyExists(SharedPreferencesManager.keyAccessToken);

    final isKasir = prefs.isKeyExists(SharedPreferencesManager.keyAccessKasir);

    return GetMaterialApp(
      title: 'CaffeShop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
      ),
      getPages: [
        GetPage(
          name: DrawerNavigation.route,
          page: () => DrawerNavigation(),
        ),
      ],
      home: isKasir
          ? Kasir()
          : isLogin
              ? DrawerNavigation()
              : LoginScreen(),
    );
  }
}
