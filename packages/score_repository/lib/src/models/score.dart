import 'package:equatable/equatable.dart';

/// {@template score}
/// Score model
///
/// [Score] model is used to represent the financial health of the user.
/// {@endtemplate}
class Score extends Equatable {
  /// {@macro score}
  const Score({
    required this.annualIncome,
    required this.monthlyCosts,
    this.financialHealth = FinancialHealth.notCalculated,
  });

  /// The annual income of the user.
  final double annualIncome;

  /// The monthly costs of the user.
  final double monthlyCosts;

  /// The financial health of the user.
  final FinancialHealth financialHealth;

  @override
  List<Object?> get props => [annualIncome, monthlyCosts, financialHealth];
}

/// The financial health of the user.
enum FinancialHealth {
  /// The financial health is not calculated.
  notCalculated,

  /// The user is in a healthy financial state.
  healthy,

  /// The user is in an average financial state.
  average,

  /// The user is in a poor financial state.
  caution,
}
