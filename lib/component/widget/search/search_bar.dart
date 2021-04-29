import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      decoration: InputDecoration(
        hintText: "Hallooo",
      ),
    );
  }
}
