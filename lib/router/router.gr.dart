// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:shop_app/models/cards/models.dart' as _i11;
import 'package:shop_app/screens/auth_screen.dart' as _i1;
import 'package:shop_app/screens/home/cards/cards_screen.dart' as _i3;
import 'package:shop_app/screens/home/cards/modals/card_form_screen.dart'
    as _i2;
import 'package:shop_app/screens/home/home_screen.dart' as _i4;
import 'package:shop_app/screens/home/home_wrapper.dart' as _i5;
import 'package:shop_app/screens/home/products/products_screen.dart' as _i7;
import 'package:shop_app/screens/home/settings/settings_screen.dart' as _i8;
import 'package:shop_app/screens/login/login_screen.dart' as _i6;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthScreen(),
      );
    },
    CardsFormRoute.name: (routeData) {
      final args = routeData.argsAs<CardsFormRouteArgs>(
          orElse: () => const CardsFormRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(
            child: _i2.CardsFormScreen(
          key: args.key,
          card: args.card,
        )),
      );
    },
    CardsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i3.CardsScreen()),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeWrapperScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i6.LoginScreen()),
      );
    },
    ProductsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i7.ProductsScreen()),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i9.PageRouteInfo<void> {
  const AuthRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CardsFormScreen]
class CardsFormRoute extends _i9.PageRouteInfo<CardsFormRouteArgs> {
  CardsFormRoute({
    _i10.Key? key,
    _i11.Card? card,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          CardsFormRoute.name,
          args: CardsFormRouteArgs(
            key: key,
            card: card,
          ),
          initialChildren: children,
        );

  static const String name = 'CardsFormRoute';

  static const _i9.PageInfo<CardsFormRouteArgs> page =
      _i9.PageInfo<CardsFormRouteArgs>(name);
}

class CardsFormRouteArgs {
  const CardsFormRouteArgs({
    this.key,
    this.card,
  });

  final _i10.Key? key;

  final _i11.Card? card;

  @override
  String toString() {
    return 'CardsFormRouteArgs{key: $key, card: $card}';
  }
}

/// generated route for
/// [_i3.CardsScreen]
class CardsRoute extends _i9.PageRouteInfo<void> {
  const CardsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CardsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeWrapperScreen]
class HomeRouter extends _i9.PageRouteInfo<void> {
  const HomeRouter({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouter';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProductsScreen]
class ProductsRoute extends _i9.PageRouteInfo<void> {
  const ProductsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SettingsScreen]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
