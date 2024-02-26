import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/blocs/feature_flag/feature_flag_bloc.dart';
import 'package:shop_app/localization/index.dart';
import 'package:shop_app/router/index.dart';
import 'package:shop_app/services/index.dart';
import 'package:shop_app/widgets/index.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);

    return BlocSelector<FeatureFlagBloc, FeatureFlagState, bool>(
      selector: (state) => state.isEnabled(FeatureFlag.cartsTab),
      builder: (context, isFeatureEnabled) {
        return AutoTabsScaffold(
          endDrawer: const AppDrawer(),
          routes: [
            if (isFeatureEnabled) const CartsRoute(),
            const ProductsRoute(),
            const SettingsRoute(),
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            return DecoratedBox(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: tabsRouter.activeIndex,
                onTap: tabsRouter.setActiveIndex,
                items: [
                  if (isFeatureEnabled)
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.shopping_cart),
                      label: LocaleKeys.cards.tr(),
                    ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.storefront),
                    label: LocaleKeys.products.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
                    label: LocaleKeys.settings.tr(),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
