import 'dart:async';

import 'package:caffeshop/app.dart';
import 'package:caffeshop/component/utils/injector.dart';
import 'package:caffeshop/component/utils/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  ///RUN APP
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyBlocObserver();
    // ignore: await_only_futures
    await setupLocator();
    runApp(App());
  }, (e, s) {
    print("ERROR :$e");
    print("STACKTRACE :$s");
  });
}
