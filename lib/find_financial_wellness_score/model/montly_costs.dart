import 'package:formz/formz.dart';

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
