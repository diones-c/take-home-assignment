import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kalshi/constants/assets_paths.dart';
import 'package:kalshi/theme/colors.dart';
import 'package:kalshi/theme/spacings.dart';
import 'package:kalshi/theme/typographies.dart';

class FinancialEncryptedInformation extends StatelessWidget {
  final String informationText;
  const FinancialEncryptedInformation({
    required this.informationText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(AssetPaths.lock),
        const SizedBox(height: Spacings.componentM),
        Text(
          informationText,
          style: Typographies.xsDescription.copyWith(
            color: AppColors.info,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
