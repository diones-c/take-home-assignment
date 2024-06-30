import 'package:score_repository/src/models/score.dart';

/// {@template score_repository}
/// A Very Good Project created by Very Good CLI.
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
    final monthlyCosts = score.monthlyCosts;
    final monthlyIncome = score.annualIncome / 12;

    if (monthlyCosts <= 0.01 * monthlyIncome) {
      return Score(
        annualIncome: annualIncome,
        monthlyCosts: monthlyIncome,
        financialHealth: FinancialHealth.healthy,
      );
    } else if (monthlyCosts <= 0.03 * monthlyIncome) {
      return Score(
        annualIncome: annualIncome,
        monthlyCosts: monthlyIncome,
        financialHealth: FinancialHealth.average,
      );
    } else {
      return Score(
        annualIncome: annualIncome,
        monthlyCosts: monthlyIncome,
        financialHealth: FinancialHealth.caution,
      );
    }
  }
}
