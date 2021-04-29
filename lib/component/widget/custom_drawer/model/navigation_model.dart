import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Pembayaran", icon: Icons.monetization_on),
  NavigationModel(title: "Bantuan", icon: Icons.error),
  NavigationModel(title: "Pangaturan", icon: Icons.search),
  NavigationModel(title: "Feedback", icon: Icons.notifications),
];
