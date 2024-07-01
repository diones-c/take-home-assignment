part of 'financial_wellness_score_result_cubit.dart';

sealed class FinancialWellnessScoreResultState extends Equatable {
  const FinancialWellnessScoreResultState();

  @override
  List<Object> get props => [];
}

final class FinancialWellnessScoreResultInitial
    extends FinancialWellnessScoreResultState {}

final class FinancialWellnessScoreResultLoadingInProgress
    extends FinancialWellnessScoreResultState {
  const FinancialWellnessScoreResultLoadingInProgress();
}

final class FinancialWellnessScoreResultSuccess
    extends FinancialWellnessScoreResultState {
  final Score score;

  const FinancialWellnessScoreResultSuccess(this.score);

  @override
  List<Object> get props => [score];
}

final class FinancialWellnessScoreResultFailure
    extends FinancialWellnessScoreResultState {
  const FinancialWellnessScoreResultFailure();
}
