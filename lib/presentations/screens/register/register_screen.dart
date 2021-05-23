import 'dart:ui';

import 'package:caffeshop/component/widget/loader/loader_widget.dart';
import 'package:caffeshop/data/models/request/register_body.dart';
import 'package:caffeshop/presentations/blocs/register/register_bloc.dart';
import 'package:caffeshop/presentations/screens/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterBloc registerBloc = RegisterBloc();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool obscureText = true;

  void onPressedRegister() {
    FocusScope.of(context).unfocus();
    registerBloc.add(OnRegisterEvent(
      RegisterBody(
        name: nameController.text.trim(),
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        telpNumber: telpController.text.trim(),
        previlage: "user",
      ),
    ));
  }

  //* show password
  void togglePassword() {
    setState(() {
      obscureText ? obscureText = false : obscureText = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => registerBloc,
        child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterException) {
                Get.snackbar(
                  'Gagal',
                  state.message,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
              if (state is RegisterFailure) {
                Get.snackbar(
                  'Gagal',
                  state.message,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              } else if (state is RegisterSuccess) {
                Get.snackbar(
                  'Sukses',
                  "Register Berhasil",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
                Future.delayed(Duration(milliseconds: 1700), () {
                  Get.offAll(LoginScreen());
                });
              }
            },
            child: Stack(
              children: [
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
                                    "DAFTAR",
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
                                  _buildTextFieldName(),
                                  const SizedBox(height: 10),
                                  _buildTextFieldUsername(),
                                  const SizedBox(height: 10),
                                  _buildTextFieldEmail(),
                                  const SizedBox(height: 10),
                                  _buildTextFieldPassword(),
                                  const SizedBox(height: 10),
                                  _buildTextFieldNoTelp(),
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
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                  if (state is RegisterLoading) {
                    return LoaderWidget(title: "Register...");
                  }
                  return const SizedBox.shrink();
                }),
              ],
            )));
  }

  Widget _buildTextFieldName() {
    return TextFormField(
      controller: nameController,
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
        hintText: "Nama",
      ),
    );
  }

  Widget _buildTextFieldEmail() {
    return TextFormField(
      controller: emailController,
      textAlignVertical: TextAlignVertical.center,
      decoration: new InputDecoration(
        filled: true,
        fillColor: CupertinoColors.extraLightBackgroundGray,
        border: InputBorder.none,
        prefixIcon: Icon(Icons.email),
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
        hintText: "Email",
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

  Widget _buildTextFieldNoTelp() {
    return TextFormField(
      controller: telpController,
      keyboardType: TextInputType.number,
      textAlignVertical: TextAlignVertical.center,
      decoration: new InputDecoration(
        filled: true,
        fillColor: CupertinoColors.extraLightBackgroundGray,
        border: InputBorder.none,
        prefixIcon: Icon(Icons.phone),
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
        hintText: "Nomor telephone",
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
        "Daftar",
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
