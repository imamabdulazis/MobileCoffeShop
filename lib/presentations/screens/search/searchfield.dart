import 'dart:async';

import 'package:caffeshop/component/common/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key key,
    this.onChange,
    this.debounceTime,
  }) : super(key: key);

  final ValueChanged<String> onChange;
  final Duration debounceTime;

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final StreamController<String> _textChangeStreamController =
      StreamController();
  StreamSubscription _textChangesSubscription;

  @override
  void initState() {
    super.initState();
    _textChangesSubscription = _textChangeStreamController.stream
        .debounceTime(widget.debounceTime ?? const Duration(seconds: 1))
        .distinct()
        .listen((text) {
      if (widget.onChange != null) {
        widget.onChange(text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.transparent,
      child: TextFormField(
        onChanged: _textChangeStreamController.add,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Palette.primaryColor,
        style: TextStyle(fontSize: 15.0, color: Colors.white),
        decoration: InputDecoration(
          fillColor: Colors.white,
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textChangeStreamController.close();
    _textChangesSubscription.cancel();
    super.dispose();
  }
}
