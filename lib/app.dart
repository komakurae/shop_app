import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:shop_app/app_state_wrapper.dart';
import 'package:shop_app/router/index.dart';
import 'package:shop_app/services/index.dart';
import 'package:shop_app/styles/index.dart';

class ShopApp extends StatelessWidget {
  ShopApp({super.key});

  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return AppStateWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getAppTheme(context),
        routerConfig: _appRouter.config(
          navigatorObservers: () => [RouterObserver(LoggerService.instance)],
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
