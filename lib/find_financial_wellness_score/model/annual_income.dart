import 'package:formz/formz.dart';

final class AnnualIncome
    extends FormzInput<double, AnnualIncomeValidationError> {
  const AnnualIncome.pure() : super.pure(0.0);
  const AnnualIncome.dirty([double value = 0.0]) : super.dirty(value);

  @override
  AnnualIncomeValidationError? validator(double value) {
    if (value == 0.0) {
      return AnnualIncomeValidationError.empty;
    } else if (value < 0.0) {
      return AnnualIncomeValidationError.invalid;
    } else {
      return null;
    }
  }
}

enum AnnualIncomeValidationError {
  empty,
  invalid,
}
