import 'package:flutter/material.dart';

import 'package:shop_app/styles/index.dart';

class AppTheme {
  static ThemeData getAppTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: Colors.purple,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepPurple,
      ),
      fontFamily: FontFamily.poppins,
    );
  }
}
