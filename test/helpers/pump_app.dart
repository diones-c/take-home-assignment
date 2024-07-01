import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';
import 'package:score_repository/score_repository.dart';

class MockScoreRepository extends Mock implements ScoreRepository {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget child, {
    ScoreRepository? scoreRepository,
  }) {
    return pumpWidget(
      RepositoryProvider.value(
        value: scoreRepository ?? MockScoreRepository(),
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: child),
        ),
      ),
    );
  }
}
