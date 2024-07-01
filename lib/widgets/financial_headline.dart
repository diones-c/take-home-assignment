import 'package:flutter/material.dart';
import 'package:kalshi/theme/typographies.dart';

class FinancialHeadline extends StatelessWidget {
  final String firstTitle;
  final String lastTitle;

  const FinancialHeadline({
    required this.firstTitle,
    required this.lastTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: Typographies.xsSubtitle,
        children: [
          TextSpan(text: firstTitle),
          TextSpan(
            text: lastTitle,
            style: Typographies.lgSubtitle,
          )
        ],
      ),
    );
  }
}
