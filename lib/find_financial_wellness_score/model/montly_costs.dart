import 'package:formz/formz.dart';

/// A class representing the monthly costs input.
///
/// It extends [FormzInput] and uses [double] as the value type and
/// [MonthlyCostsValidationError] as the error type.
final class MonthlyCosts
    extends FormzInput<double, MonthlyCostsValidationError> {
  const MonthlyCosts.pure() : super.pure(0.0);
  const MonthlyCosts.dirty([double value = 0.0]) : super.dirty(value);

  @override
  MonthlyCostsValidationError? validator(double value) {
    if (value == 0.0) {
      return MonthlyCostsValidationError.empty;
    } else if (value < 0.0) {
      return MonthlyCostsValidationError.invalid;
    } else {
      return null;
    }
  }
}

enum MonthlyCostsValidationError {
  empty,
  invalid,
}
