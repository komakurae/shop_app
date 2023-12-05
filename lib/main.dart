import 'package:flutter/material.dart';

import 'package:shop_app/localization/index.dart';
import 'app.dart';
import 'app_initialization.dart';

void main() async {
  await initializeApp();

  runApp(
    EasyLocalization(
      path: CodegenLoader.path,
      supportedLocales: CodegenLoader.supportedLocales,
      fallbackLocale: CodegenLoader.supportedLocales.last,
      assetLoader: const CodegenLoader(),
      child: ShopApp(),
    ),
  );
}
