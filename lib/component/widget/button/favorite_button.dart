import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritButton extends StatelessWidget {
  final Function onPress;
  final double size;

  const FavoritButton({
    Key key,
    this.onPress,
    this.size = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.grey,
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onPress,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            CupertinoIcons.heart,
            color: Colors.teal,
            size: size,
          ),
        ),
      ),
    );
  }
}
