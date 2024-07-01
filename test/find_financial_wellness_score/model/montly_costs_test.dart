import 'package:flutter_test/flutter_test.dart';
import 'package:kalshi/find_financial_wellness_score/model/montly_costs.dart';

void main() {
  const monthlyCostsString = 10000.0;
  group('MonthlyCosts', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        const monthlyCosts = MonthlyCosts.pure();
        expect(monthlyCosts.value, 0.0);
        expect(monthlyCosts.isPure, true);
      });

      test('dirty creates correct instance', () {
        const monthlyCosts = MonthlyCosts.dirty(monthlyCostsString);
        expect(monthlyCosts.value, monthlyCostsString);
        expect(monthlyCosts.isPure, isFalse);
      });
    });

    group('validator', () {
      test('returns empty error when annual income is empty', () {
        expect(
          const MonthlyCosts.dirty().error,
          MonthlyCostsValidationError.empty,
        );
      });

      test('is valid annual income is not empty', () {
        expect(
          const MonthlyCosts.dirty(monthlyCostsString).error,
          isNull,
        );
      });
    });
  });
}
