import 'package:caffeshop/component/constants/share_preference.dart';
import 'package:caffeshop/component/utils/injector.dart';
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

  @override
  Widget build(BuildContext context) {
    final isLogin = prefs.isKeyExists(SharedPreferencesManager.keyAccessToken);

    return GetMaterialApp(
      title: 'CaffeShop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: isLogin ? DrawerNavigation() : LoginScreen(),
    );
  }
}
