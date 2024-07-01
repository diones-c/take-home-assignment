import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi/financial_wellness_score_result/financial_wellness_score_result.dart';
import 'package:mocktail/mocktail.dart';
import 'package:score_repository/score_repository.dart';

class MockScoreRepository extends Mock implements ScoreRepository {}

class FakeScore extends Fake implements Score {}

void main() {
  late MockScoreRepository scoreRepository;
  const scoreWithoutFinancialHealth = Score(
    annualIncome: 1000.0,
    monthlyCosts: 10,
  );
  const score = Score(
    annualIncome: 1000.0,
    monthlyCosts: 10,
    financialHealth: FinancialHealth.healthy,
  );

  group('FinancialWellnessScoreResultCubit', () {
    setUp(() {
      scoreRepository = MockScoreRepository();
      registerFallbackValue(score);
      when(() => scoreRepository.getFinancialScore(score: any(named: 'score')))
          .thenReturn(score);
    });

    test('initial state is FinancialWellnessScoreResultInitial', () {
      expect(
        FinancialWellnessScoreResultCubit(
                scoreRepository: scoreRepository, score: score)
            .state,
        FinancialWellnessScoreResultInitial(),
      );
    });

    group('load', () {
      blocTest<FinancialWellnessScoreResultCubit,
          FinancialWellnessScoreResultState>(
        'emits [FinancialWellnessScoreResultSuccess] when scoreRepository.getFinancialScore returns score',
        build: () => FinancialWellnessScoreResultCubit(
          scoreRepository: scoreRepository,
          score: scoreWithoutFinancialHealth,
        ),
        act: (cubit) => cubit.load(),
        expect: () => <FinancialWellnessScoreResultState>[
          const FinancialWellnessScoreResultLoadingInProgress(),
          const FinancialWellnessScoreResultSuccess(Score(
            annualIncome: 1000.0,
            monthlyCosts: 10,
            financialHealth: FinancialHealth.healthy,
          )),
        ],
      );

      blocTest(
        'emits [FinancialWellnessScoreResultFailure] when scoreRepository.getFinancialScore throws',
        setUp: () {
          when(() =>
                  scoreRepository.getFinancialScore(score: any(named: 'score')))
              .thenThrow(Exception('oops'));
        },
        build: () => FinancialWellnessScoreResultCubit(
          scoreRepository: MockScoreRepository(),
          score: scoreWithoutFinancialHealth,
        ),
        act: (cubit) => cubit.load(),
        expect: () => <FinancialWellnessScoreResultState>[
          const FinancialWellnessScoreResultLoadingInProgress(),
          const FinancialWellnessScoreResultFailure(),
        ],
      );
    });
  });
}
