import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentations/screens/drawer/drawer_navigation.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CaffeShop',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: DrawerNavigation(),
    );
  }
}
