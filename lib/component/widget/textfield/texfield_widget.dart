import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final IconData iconPrefix;

  const TextFieldWidget(
      {Key key, this.controller, this.placeholder, this.iconPrefix})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      decoration: new InputDecoration(
        filled: true,
        fillColor: CupertinoColors.extraLightBackgroundGray,
        border: InputBorder.none,
        prefixIcon: Icon(iconPrefix),
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
        hintText: placeholder,
      ),
    );
  }
}
