import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final bool isBorder;
  final Function onPress;
  final Widget title;

  const CustomIconButton({
    Key key,
    this.isBorder = false,
    this.onPress,
    this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: isBorder ? Colors.white : Colors.teal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(color: Colors.teal),
      ),
      child: InkWell(
        onTap: onPress,
        borderRadius: BorderRadius.circular(100),
        child: SizedBox(
          width: 35,
          height: 35,
          child: Center(
            child: title,
          ),
        ),
      ),
    );
  }
}
