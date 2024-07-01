import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi/find_financial_wellness_score/model/annual_income.dart';

void main() {
  const annualIncomeString = 10000.0;
  group('AnnualIncome', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        const annualIncome = AnnualIncome.pure();
        expect(annualIncome.value, '');
        expect(annualIncome.isPure, true);
      });

      test('dirty creates correct instance', () {
        const annualIncome = AnnualIncome.dirty(annualIncomeString);
        expect(annualIncome.value, annualIncomeString);
        expect(annualIncome.isPure, isFalse);
      });
    });

    group('validator', () {
      test('returns empty error when annual income is empty', () {
        expect(
          const AnnualIncome.dirty().error,
          AnnualIncomeValidationError.empty,
        );
      });

      test('is valid annual income is not empty', () {
        expect(
          const AnnualIncome.dirty(annualIncomeString).error,
          isNull,
        );
      });
    });
  });
}
