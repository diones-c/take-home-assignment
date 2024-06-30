import 'package:flutter/material.dart';
import 'package:kalshi/find_financial_wellness_score/find_finanancial_wellness_score.dart';
import 'package:kalshi/l10n/l10n.dart';
import 'package:kalshi/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlutterKalshiTheme.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const FindFinancialWellnessScorePage(),
    );
  }
}
