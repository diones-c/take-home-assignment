import 'package:score_repository/src/models/score.dart';

/// {@template score_repository}
/// A Score repository which manages the financial score.
/// {@endtemplate}
class ScoreRepository {
  /// {@macro score_repository}
  const ScoreRepository();

  /// Gets the financial score
  ///
  /// The financial score is determined by comparing the monthly costs to a
  /// percentage of the monthly income.
  /// If the monthly costs are less than or equal to 1% of the monthly income,
  /// the financial health is considered "healthy".
  /// If the monthly costs are less than or equal to 3% of the monthly income,
  /// the financial health is considered "average".
  /// Otherwise, the financial health is considered "caution".
  ///
  /// Returns a [Score] object representing the calculated financial score.
  Score getFinancialScore({
    required Score score,
  }) {
    final annualIncome = score.annualIncome;
    final annualNetCompensation = annualIncome - (0.08 * annualIncome);

    final monthlyCosts = score.monthlyCosts;
    final annualCosts = monthlyCosts * 12;

    final costPercentage = (annualCosts / annualNetCompensation) * 100;

    if (costPercentage <= 25) {
      return Score(
        annualIncome: annualIncome,
        monthlyCosts: monthlyCosts,
        financialHealth: FinancialHealth.healthy,
      );
    } else if (costPercentage <= 75) {
      return Score(
        annualIncome: annualIncome,
        monthlyCosts: monthlyCosts,
        financialHealth: FinancialHealth.average,
      );
    } else {
      return Score(
        annualIncome: annualIncome,
        monthlyCosts: monthlyCosts,
        financialHealth: FinancialHealth.caution,
      );
    }
  }
}
