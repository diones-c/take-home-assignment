import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalshi/theme/colors.dart';

abstract class Typographies {
  const Typographies._();

  static final xsSubtitle = GoogleFonts.workSans().copyWith(
    color: AppColors.primary,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static final lgSubtitle = GoogleFonts.workSans().copyWith(
    color: AppColors.primary,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static final xsHeadingSmall = GoogleFonts.rubik().copyWith(
    color: AppColors.secondary,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  static final xsParagraph = GoogleFonts.workSans().copyWith(
    color: AppColors.info,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static final xsDescription = GoogleFonts.workSans().copyWith(
    color: AppColors.secondary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static final lgHeadingSmall = GoogleFonts.rubik().copyWith(
    color: AppColors.secondary,
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  static final button = GoogleFonts.workSans().copyWith(
    color: AppColors.background,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
