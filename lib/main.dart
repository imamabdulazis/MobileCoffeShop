import 'dart:async';

import 'package:caffeshop/app.dart';
import 'package:flutter/material.dart';

void main() {
  ///RUN APP
  runZonedGuarded(() async {
    runApp(App());
  }, (e, s) {
    print("ERROR :$e");
    print("STACKTRACE :$s");
  });
}
