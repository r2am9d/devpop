import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:devpop/core/utils/utils.dart';
import 'package:flutter/widgets.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (err) {
    AppLog.e(
      err.exceptionAsString(),
      error: err,
      trace: err.stack,
    );
  };

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here

  runApp(await builder());
}
