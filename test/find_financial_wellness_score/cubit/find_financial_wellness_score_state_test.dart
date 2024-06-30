import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:kalshi/find_financial_wellness_score/find_finanancial_wellness_score.dart';
import 'package:kalshi/find_financial_wellness_score/model/annual_income.dart';
import 'package:kalshi/find_financial_wellness_score/model/montly_costs.dart';

void main() {
  const annualIncome = AnnualIncome.dirty('10000');
  const monthlyCosts = MonthlyCosts.dirty('10000');

  group('FindFinancialWellnessScoreState', () {
    test('supports value comparisons', () {
      expect(
        const FindFinancialWellnessScoreState(),
        const FindFinancialWellnessScoreState(),
      );
    });

    test('returns same object when no properts are passed', () {
      expect(
        const FindFinancialWellnessScoreState().copyWith(),
        const FindFinancialWellnessScoreState(),
      );
    });

    test('returns object with updated status when status is passed', () {
      expect(
        const FindFinancialWellnessScoreState().copyWith(
          status: FormzSubmissionStatus.initial,
        ),
        const FindFinancialWellnessScoreState(),
      );
    });

    test('returns object with updated annualIncome when annualIncome is passed',
        () {
      expect(
        const FindFinancialWellnessScoreState()
            .copyWith(annualIncome: annualIncome),
        const FindFinancialWellnessScoreState(annualIncome: annualIncome),
      );
    });

    test('returns object with updated monthlyCosts when monthlyCosts is passed',
        () {
      expect(
        const FindFinancialWellnessScoreState()
            .copyWith(monthlyCosts: monthlyCosts),
        const FindFinancialWellnessScoreState(monthlyCosts: monthlyCosts),
      );
    });
  });
}
