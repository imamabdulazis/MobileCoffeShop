import 'dart:ui';

import 'package:caffeshop/presentations/screens/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();


  void onPressedRegister(){}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/bg.jpeg'), fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.5),
            width: Get.width,
            height: Get.height,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 30),
                      Image.asset(
                        'assets/img/icon.png',
                        width: Get.width / 3,
                        height: Get.width / 3,
                      ),
                      const SizedBox(height: 50),
                      _buildTextFieldUsername(),
                      const SizedBox(height: 10),
                      _buildTextFieldPassword(),
                      const SizedBox(height: 10),
                      _buildLoginButton(context),
                      const SizedBox(height: 10),
                      _buildAlreadyAccount(context),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldUsername() {
    return TextFormField(
      controller: usernameController,
      textAlignVertical: TextAlignVertical.center,
      decoration: new InputDecoration(
        filled: true,
        fillColor: CupertinoColors.extraLightBackgroundGray,
        border: InputBorder.none,
        prefixIcon: Icon(Icons.person),
        focusedBorder: OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.white),
          borderRadius: new BorderRadius.circular(25.7),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: new BorderSide(color: Colors.white),
          borderRadius: new BorderRadius.circular(25.7),
        ),
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: const EdgeInsets.only(
            top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
        hintText: "Username",
      ),
    );
  }

  Widget _buildTextFieldPassword() {
    return TextFormField(
      controller: passwordController,
      textAlignVertical: TextAlignVertical.center,
      decoration: new InputDecoration(
        filled: true,
        fillColor: CupertinoColors.extraLightBackgroundGray,
        border: InputBorder.none,
        prefixIcon: Icon(Icons.lock),
        focusedBorder: OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.white),
          borderRadius: new BorderRadius.circular(25.7),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: new BorderSide(color: Colors.white),
          borderRadius: new BorderRadius.circular(25.7),
        ),
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: const EdgeInsets.only(
            top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
        hintText: "Username",
      ),
    );
  }

  Widget _buildLoginButton(context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.teal),
          shape: MaterialStateProperty.all(
            new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 10),
          )),
      onPressed: onPressedRegister,
      child: Text(
        "Masuk",
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }

  Widget _buildAlreadyAccount(context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      buttonPadding: EdgeInsets.symmetric(horizontal: 2.5, vertical: 2.0),
      children: [
        Text(
          "Sudah punya akun?",
          style: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(color: Colors.white),
        ),
        InkWell(
            onTap: () {
              Get.offAll(LoginScreen());
            },
            child: Text(
              "login",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(color: Colors.white),
            ))
      ],
    );
  }
}
