import 'package:flutter/material.dart';

import 'package:shop_app/styles/index.dart';

class AppTheme {
  static ThemeData getAppTheme(BuildContext context) {
    return ThemeData(
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: AppColors.primary,
      ),
      fontFamily: FontFamily.poppins,
    );
  }
}
