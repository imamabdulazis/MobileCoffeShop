import 'package:flutter/material.dart';

class PrimarygGreenButton extends StatelessWidget {
  final String text;
  final Function function;

  const PrimarygGreenButton({Key key, this.text, this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.teal,
          boxShadow: [
            BoxShadow(
              color: Colors.teal.withOpacity(0.3),
              offset: Offset(0.0, 4),
              blurRadius: 10,
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: function,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
