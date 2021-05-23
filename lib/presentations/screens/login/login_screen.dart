import 'dart:ui';

import 'package:caffeshop/component/widget/loader/loader_widget.dart';
import 'package:caffeshop/data/models/request/login_body.dart';
import 'package:caffeshop/presentations/blocs/login/login_bloc.dart';
import 'package:caffeshop/presentations/screens/drawer/drawer_navigation.dart';
import 'package:caffeshop/presentations/screens/payment/payment_screen.dart';
import 'package:caffeshop/presentations/screens/register/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginBloc loginBloc = LoginBloc();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool obscureText = true;

  //* show password
  void togglePassword() {
    setState(() {
      obscureText ? obscureText = false : obscureText = true;
    });
  }

  void onPressedLogin() async {
    FocusScope.of(context).unfocus();
    loginBloc.add(
      OnChangeLogin(
        LoginBody(
          username: usernameController.text.trim(),
          password: passwordController.text.trim(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext conRtext) {
    return BlocProvider(
      create: (context) => loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginException) {
            Get.snackbar(
              'Gagal',
              state.title,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
          if (state is LoginFailure) {
            Get.snackbar(
              'Gagal',
              state.message == "Unauthorized request"
                  ? "Username atau password salah"
                  : state.message,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          } else if (state is LoginSuccess) {
            Get.to(DrawerNavigation());
          }
        },
        child: Stack(children: [
          Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/bg.jpeg'),
                      fit: BoxFit.cover)),
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
                            Text(
                              "LOGIN",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
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
                            _buildCreateAccount(context),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            if (state is LoginLoading) {
              return LoaderWidget(title: "Loading...");
            }
            return const SizedBox.shrink();
          }),
        ]),
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
      obscureText: obscureText,
      decoration: new InputDecoration(
        filled: true,
        fillColor: CupertinoColors.extraLightBackgroundGray,
        border: InputBorder.none,
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          icon:
              obscureText ? Icon(FeatherIcons.eye) : Icon(FeatherIcons.eyeOff),
          onPressed: togglePassword,
        ),
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
        hintText: "Password",
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
      onPressed: onPressedLogin,
      child: Text(
        "Masuk",
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }

  Widget _buildCreateAccount(context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      buttonPadding: EdgeInsets.symmetric(horizontal: 2.5, vertical: 2.0),
      children: [
        Text(
          "Belum punya akun?",
          style: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(color: Colors.white),
        ),
        InkWell(
            onTap: () {
              Get.to(RegisterScreen());
            },
            child: Text(
              "daftar",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(color: Colors.white),
            ))
      ],
    );
  }
}
