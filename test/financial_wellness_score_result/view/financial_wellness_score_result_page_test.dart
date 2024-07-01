import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi/financial_wellness_score_result/financial_wellness_score_result.dart';
import 'package:mocktail/mocktail.dart';
import 'package:score_repository/score_repository.dart';

import '../../helpers/helpers.dart';

class MockScoreRepository extends Mock implements ScoreRepository {}

class MockFindFinancialWellnessScoreCubit extends Mock
    implements FinancialWellnessScoreResultCubit {}

void main() {
  late ScoreRepository scoreRepository;
  late FinancialWellnessScoreResultCubit cubit;
  const score = Score(
    annualIncome: 1000,
    monthlyCosts: 10,
    financialHealth: FinancialHealth.healthy,
  );

  setUp(() {
    scoreRepository = MockScoreRepository();
    cubit = MockFindFinancialWellnessScoreCubit();
    registerFallbackValue(score);

    when(() => scoreRepository.getFinancialScore(score: any(named: 'score')))
        .thenReturn(score);
  });

  group('group name', () {
    Widget buildSubject() {
      return BlocProvider.value(
        value: cubit,
        child: const FinancialWellnessScoreResultPage(
          financialWellnessScoreResultArguments:
              FinancialWellnessScoreResultArguments(score: score),
        ),
      );
    }

    testWidgets(
      'renders correctly with loading state',
      (tester) async {
        when(() => cubit.state)
            .thenReturn(FinancialWellnessScoreResultInitial());
        await tester.pumpApp(buildSubject());

        expect(find.byType(FinancialWellnessScoreResultPage), findsOneWidget);
        expect(find.byType(RefreshProgressIndicator), findsNothing);
      },
    );

    testWidgets(
      'renders correctly with success state and healthy score',
      (tester) async {
        whenListen(
          cubit,
          Stream.fromIterable(
            [
              FinancialWellnessScoreResultInitial(),
              const FinancialWellnessScoreResultLoadingInProgress(),
              const FinancialWellnessScoreResultSuccess(score)
            ],
          ),
        );
        await tester.pumpApp(buildSubject(), scoreRepository: scoreRepository);
        await tester.pumpAndSettle();

        expect(find.byType(FinancialWellnessScoreResultPage), findsOneWidget);
        expect(find.text('Congratulations!'), findsOneWidget);
        expect(
          find.textContaining(
            'Your financial wellness score is ',
            findRichText: true,
          ),
          findsOneWidget,
        );
        expect(
          find.textContaining(
            'Healthy.',
            findRichText: true,
          ),
          findsOneWidget,
        );
      },
    );
  });
}
