import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi/financial_wellness_score_result/cubit/financial_wellness_score_result_cubit.dart';
import 'package:score_repository/score_repository.dart';

class FakeScore extends Fake implements Score {}

void main() {
  group('FinancialWellnessScoreResultState', () {
    group('FinancialWellnessScoreResultState', () {
      test('supports value comparison', () {
        expect(
          FinancialWellnessScoreResultInitial(),
          FinancialWellnessScoreResultInitial(),
        );
      });
    });

    group('FinancialWellnessScoreResultLoadingInProgress', () {
      test('supports value comparison', () {
        expect(
          const FinancialWellnessScoreResultLoadingInProgress(),
          const FinancialWellnessScoreResultLoadingInProgress(),
        );
      });
    });

    group('FinancialWellnessScoreResultSuccess', () {
      test('supports value comparison', () {
        final score = FakeScore();
        expect(
          FinancialWellnessScoreResultSuccess(score),
          FinancialWellnessScoreResultSuccess(score),
        );
      });
    });

    group('FinancialWellnessScoreResultFailure', () {
      test('supports value comparison', () {
        expect(
          const FinancialWellnessScoreResultFailure(),
          const FinancialWellnessScoreResultFailure(),
        );
      });
    });
  });
}
