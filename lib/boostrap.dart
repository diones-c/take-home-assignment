import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:kalshi/app/app.dart';
import 'package:kalshi/app/app_bloc_observer.dart';
import 'package:score_repository/score_repository.dart';

void boostrap() {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  const scoreRepository = ScoreRepository();

  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(const App(scoreRepository: scoreRepository));
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
