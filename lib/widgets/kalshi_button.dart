import 'package:flutter/material.dart';
import 'package:kalshi/theme/colors.dart';
import 'package:kalshi/theme/spacings.dart';
import 'package:kalshi/theme/typographies.dart';

enum KalshiButtonType { primary, secondary }

class KalshiButton extends StatelessWidget {
  final String buttonLabel;
  final Function()? onPressed;
  final KalshiButtonType buttonType;

  const KalshiButton({
    required this.buttonLabel,
    required this.onPressed,
    this.buttonType = KalshiButtonType.primary,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = buttonType == KalshiButtonType.primary
        ? MaterialStateProperty.all(AppColors.primary)
        : null;
    final shape = MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Spacings.componentXl),
        side: buttonType == KalshiButtonType.primary
            ? BorderSide.none
            : const BorderSide(color: AppColors.primary, width: 2),
      ),
    );
    final buttonLabelColor = buttonType == KalshiButtonType.primary
        ? AppColors.background
        : AppColors.buttonPrimary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextButton(
          style: ButtonStyle(
            backgroundColor: backgroundColor,
            textStyle: MaterialStateProperty.all(Typographies.button),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(Spacings.componentL),
            ),
            shape: shape,
          ),
          onPressed: onPressed,
          child: Text(
            buttonLabel,
            style: Typographies.button.copyWith(color: buttonLabelColor),
          ),
        ),
      ],
    );
  }
}
