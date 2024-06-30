import 'package:flutter/material.dart';
import 'package:kalshi/theme/colors.dart';

class FlutterKalshiTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(color: AppColors.background),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
