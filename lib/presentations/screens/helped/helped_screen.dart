import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpedScreen extends StatefulWidget {
  @override
  _HelpedScreenState createState() => _HelpedScreenState();
}

class _HelpedScreenState extends State<HelpedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.teal,
            ),
            onPressed: () {
              Get.back();
            }),
        elevation: 0,
        title: Text(
          "Pusat Bantuan",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.teal,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text("Pusat Bantuan"),
      ),
    );
  }
}
