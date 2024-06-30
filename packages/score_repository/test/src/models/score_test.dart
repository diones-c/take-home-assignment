import 'package:score_repository/src/models/score.dart';
import 'package:test/test.dart';

void main() {
  group('Score', () {
    test('uses value equality', () {
      expect(
        const Score(
          annualIncome: 100,
          monthlyCosts: 10,
          financialHealth: FinancialHealth.healthy,
        ),
        equals(
          const Score(
            annualIncome: 100,
            monthlyCosts: 10,
            financialHealth: FinancialHealth.healthy,
          ),
        ),
      );
    });

    test('supports value comparisons', () {
      expect(
        const Score(
          annualIncome: 100,
          monthlyCosts: 10,
          financialHealth: FinancialHealth.healthy,
        ),
        const Score(
          annualIncome: 100,
          monthlyCosts: 10,
          financialHealth: FinancialHealth.healthy,
        ),
      );
    });
  });
}
