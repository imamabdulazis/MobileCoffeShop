import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final double paddingV;

  const MyDivider({Key key, this.paddingV}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingV),
      child: Divider(
        color: CupertinoColors.extraLightBackgroundGray,
        // thickness: 1,
      ),
    );
  }
}
