part of 'find_financial_wellness_score_cubit.dart';

final class FindFinancialWellnessScoreState extends Equatable {
  final AnnualIncome annualIncome;
  final MonthlyCosts monthlyCosts;
  final FormzSubmissionStatus status;
  final bool isValid;

  const FindFinancialWellnessScoreState({
    this.annualIncome = const AnnualIncome.pure(),
    this.monthlyCosts = const MonthlyCosts.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
  });

  @override
  List<Object> get props => [
        annualIncome,
        monthlyCosts,
        status,
        isValid,
      ];

  FindFinancialWellnessScoreState copyWith({
    AnnualIncome? annualIncome,
    MonthlyCosts? monthlyCosts,
    FormzSubmissionStatus? status,
    bool? isValid,
  }) {
    return FindFinancialWellnessScoreState(
      annualIncome: annualIncome ?? this.annualIncome,
      monthlyCosts: monthlyCosts ?? this.monthlyCosts,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
    );
  }
}
