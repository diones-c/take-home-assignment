import 'package:flutter/material.dart';
import 'package:kalshi/theme/colors.dart';
import 'package:kalshi/theme/spacings.dart';
import 'package:kalshi/theme/typographies.dart';

class KalshiButton extends StatelessWidget {
  final String buttonLabel;
  final Function()? onPressed;

  const KalshiButton({
    required this.buttonLabel,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(Typographies.button),
            backgroundColor: MaterialStateProperty.all(AppColors.primary),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(Spacings.componentL),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Spacings.componentXl),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            buttonLabel,
            style: Typographies.button,
          ),
        ),
      ],
    );
  }
}
