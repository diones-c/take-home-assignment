import 'package:formz/formz.dart';

/// A class representing the annual income input.
///
/// It extends [FormzInput] and uses [double] as the value type and
/// [AnnualIncomeValidationError] as the error type.
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
