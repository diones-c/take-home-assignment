import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi/find_financial_wellness_score/find_financial_wellness_score.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockFindFinancialWellnessScoreCubit
    extends MockCubit<FindFinancialWellnessScoreState>
    implements FindFinancialWellnessScoreCubit {}

void main() {
  late FindFinancialWellnessScoreCubit cubit;

  setUp(() => {
        cubit = MockFindFinancialWellnessScoreCubit(),
      });

  group('FindFinancialWellnessScorePage', () {
    Widget buildSubject() {
      return BlocProvider.value(
        value: cubit,
        child: const FindFinancialWellnessScorePage(),
      );
    }

    testWidgets(
      'renders FindFinancialWellnessScore correctly',
      (tester) async {
        when(() => cubit.state)
            .thenReturn(const FindFinancialWellnessScoreState());
        await tester.pumpApp(buildSubject());

        expect(find.byType(FindFinancialWellnessScorePage), findsOneWidget);
      },
    );

    testWidgets(
      'renders Annual income must be greater than 0. correctly'
      'when annual income is 0',
      (tester) async {
        when(() => cubit.state)
            .thenReturn(const FindFinancialWellnessScoreState());

        await tester.pumpApp(buildSubject());
        await tester.enterText(find.byKey(const Key('annual_income')), '0');
        await tester.pumpAndSettle();

        expect(
            find.text('Annual income must be greater than 0.'), findsOneWidget);
      },
    );

    testWidgets(
      'renders Monthly costs must be greater than 0. correctly'
      'when monthly costs is 0',
      (tester) async {
        when(() => cubit.state)
            .thenReturn(const FindFinancialWellnessScoreState());

        await tester.pumpApp(buildSubject());
        await tester.enterText(find.byKey(const Key('monthly_costs')), '0');
        await tester.pumpAndSettle();

        expect(
            find.text('Montly costs must be greater than 0.'), findsOneWidget);
      },
    );
  });
}
