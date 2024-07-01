import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi/find_financial_wellness_score/cubit/find_financial_wellness_score_cubit.dart';
import 'package:kalshi/find_financial_wellness_score/model/models.dart';

void main() {
  const invalidAnnualIncomeString = '0';
  const invalidAnnualIncome = AnnualIncome.dirty(invalidAnnualIncomeString);

  const validAnnualIncomeString = '10000';
  const validAnnualIncome = AnnualIncome.dirty(validAnnualIncomeString);

  const invalidMonthlyCostsString = '0';
  const invalidMonthlyCosts = MonthlyCosts.dirty(invalidMonthlyCostsString);

  const validMonthlyCostsString = '1000';
  const validMonthlyCosts = MonthlyCosts.dirty(validMonthlyCostsString);

  group('FindFinancialWellnessScoreCubit', () {
    test('initial state is FindFinancialWellnessScoreState', () {
      expect(
        FindFinancialWellnessScoreCubit().state,
        const FindFinancialWellnessScoreState(),
      );
    });

    group('annualIncomeChanged', () {
      blocTest<FindFinancialWellnessScoreCubit,
          FindFinancialWellnessScoreState>(
        'emits [invalid] when annualIncome/monthlyCosts are invalid',
        build: () => FindFinancialWellnessScoreCubit(),
        act: (cubit) => cubit.annualIncomeChanged(invalidAnnualIncomeString),
        expect: () => const <FindFinancialWellnessScoreState>[
          FindFinancialWellnessScoreState(
            annualIncome: invalidAnnualIncome,
          )
        ],
      );

      blocTest(
        'emits [valid] when annualIncome/monthlyCosts are valid',
        build: () => FindFinancialWellnessScoreCubit(),
        seed: () => const FindFinancialWellnessScoreState(
          monthlyCosts: validMonthlyCosts,
        ),
        act: (cubit) => cubit.annualIncomeChanged(validAnnualIncomeString),
        expect: () => const <FindFinancialWellnessScoreState>[
          FindFinancialWellnessScoreState(
            annualIncome: validAnnualIncome,
            monthlyCosts: validMonthlyCosts,
            isValid: true,
          )
        ],
      );
    });

    group('monthlyCostsChanged', () {
      blocTest<FindFinancialWellnessScoreCubit,
          FindFinancialWellnessScoreState>(
        'emits [invalid] when annualIncome/monthlyCosts are invalid',
        build: () => FindFinancialWellnessScoreCubit(),
        act: (cubit) => cubit.monthlyCostsChanged(invalidMonthlyCostsString),
        expect: () => const <FindFinancialWellnessScoreState>[
          FindFinancialWellnessScoreState(monthlyCosts: invalidMonthlyCosts)
        ],
      );

      blocTest(
        'emits [valid] when annualIncome/monthlyCosts are valid',
        build: () => FindFinancialWellnessScoreCubit(),
        seed: () => const FindFinancialWellnessScoreState(
          annualIncome: validAnnualIncome,
        ),
        act: (cubit) => cubit.monthlyCostsChanged(validMonthlyCostsString),
        expect: () => const <FindFinancialWellnessScoreState>[
          FindFinancialWellnessScoreState(
            annualIncome: validAnnualIncome,
            monthlyCosts: validMonthlyCosts,
            isValid: true,
          )
        ],
      );
    });
  });
}
