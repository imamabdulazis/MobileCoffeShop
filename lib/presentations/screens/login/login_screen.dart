import 'package:caffeshop/data/models/request/login_body.dart';
import 'package:caffeshop/presentations/blocs/login/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void showPassword() {
    setState(() {
      obscureText ? obscureText = false : obscureText = true;
    });
  }

  void onPressedLogin() async {
    FocusScope.of(context).unfocus();
    loginBloc.add(
      OnChangeLogin(
        LoginBody(
            usernameController.text.trim(), passwordController.text.trim()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginException) {
            Get.snackbar('Gagal', state.title);
          }
          if (state is LoginFailure) {
          } else if (state is LoginSuccess) {}
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      _buildTextFieldUsername(),
                      const SizedBox(height: 10),
                      _buildTextFieldPassword(),
                      const SizedBox(height: 10),
                      _buildLoginButton(context),
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
      onPressed: onPressedLogin,
      child: Text(
        "Masuk",
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }
}
