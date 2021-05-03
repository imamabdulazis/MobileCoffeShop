import 'dart:async';

import 'package:caffeshop/app.dart';
import 'package:caffeshop/component/utils/injector.dart';
import 'package:flutter/material.dart';

void main() {
  ///RUN APP
  runZonedGuarded(() async {

    await setupLocator();
    runApp(App());
  }, (e, s) {
    print("ERROR :$e");
    print("STACKTRACE :$s");
  });
}
