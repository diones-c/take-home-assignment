import 'package:formz/formz.dart';

final class AnnualIncome
    extends FormzInput<String, AnnualIncomeValidationError> {
  const AnnualIncome.pure() : super.pure('');
  const AnnualIncome.dirty([String value = '']) : super.dirty(value);

  @override
  AnnualIncomeValidationError? validator(String value) {
    if (value.isEmpty) {
      return AnnualIncomeValidationError.empty;
    } else if (int.tryParse(value) == null || int.parse(value) <= 0) {
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
