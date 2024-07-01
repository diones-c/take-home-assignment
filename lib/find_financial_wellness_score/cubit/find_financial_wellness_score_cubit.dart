import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:kalshi/find_financial_wellness_score/model/annual_income.dart';
import 'package:kalshi/find_financial_wellness_score/model/montly_costs.dart';

part 'find_financial_wellness_score_state.dart';

class FindFinancialWellnessScoreCubit
    extends Cubit<FindFinancialWellnessScoreState> {
  FindFinancialWellnessScoreCubit()
      : super(const FindFinancialWellnessScoreState());

  void annualIncomeChanged(double value) {
    final annualIncome = AnnualIncome.dirty(value);
    emit(state.copyWith(
      annualIncome: annualIncome,
      isValid: Formz.validate([annualIncome, state.monthlyCosts]),
    ));
  }

  void monthlyCostsChanged(double value) {
    final monthlyCosts = MonthlyCosts.dirty(value);
    emit(state.copyWith(
      monthlyCosts: monthlyCosts,
      isValid: Formz.validate([state.annualIncome, monthlyCosts]),
    ));
  }

  void submitForm() {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    }
  }
}
