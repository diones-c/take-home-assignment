import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:score_repository/score_repository.dart';

part 'financial_wellness_score_result_state.dart';

class FinancialWellnessScoreResultCubit
    extends Cubit<FinancialWellnessScoreResultState> {
  FinancialWellnessScoreResultCubit({
    required ScoreRepository scoreRepository,
    required Score score,
  })  : _scoreRepository = scoreRepository,
        _score = score,
        super(FinancialWellnessScoreResultInitial());

  final ScoreRepository _scoreRepository;
  final Score _score;

  void load() {
    emit(const FinancialWellnessScoreResultLoadingInProgress());
    try {
      final score = _scoreRepository.getFinancialScore(score: _score);
      emit(FinancialWellnessScoreResultSuccess(score));
    } catch (_) {
      emit(const FinancialWellnessScoreResultFailure());
    }
  }
}
