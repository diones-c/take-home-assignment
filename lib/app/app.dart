import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/app/routes/routes.dart';
import 'package:kalshi/l10n/l10n.dart';
import 'package:kalshi/theme/theme.dart';
import 'package:score_repository/score_repository.dart';

class App extends StatelessWidget {
  const App({
    required this.scoreRepository,
    super.key,
  });

  final ScoreRepository scoreRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: scoreRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: FlutterKalshiTheme.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
