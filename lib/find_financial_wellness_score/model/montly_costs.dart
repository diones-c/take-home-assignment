import 'package:formz/formz.dart';

final class MonthlyCosts
    extends FormzInput<String, MonthlyCostsValidationError> {
  const MonthlyCosts.pure() : super.pure('');
  const MonthlyCosts.dirty([String value = '']) : super.dirty(value);

  @override
  MonthlyCostsValidationError? validator(String value) {
    if (value.isEmpty) {
      return MonthlyCostsValidationError.empty;
    } else if (int.tryParse(value) == null || int.parse(value) <= 0) {
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
