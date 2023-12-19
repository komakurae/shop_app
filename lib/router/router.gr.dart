// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:shop_app/models/cards/models.dart' as _i13;
import 'package:shop_app/models/product/models.dart' as _i12;
import 'package:shop_app/screens/auth_screen.dart' as _i2;
import 'package:shop_app/screens/home/cards/cards_screen.dart' as _i4;
import 'package:shop_app/screens/home/cards/modals/add_edit_form_screen/card_form_screen.dart'
    as _i3;
import 'package:shop_app/screens/home/cards/modals/add_product_screen/add_product_screen.dart'
    as _i1;
import 'package:shop_app/screens/home/home_screen.dart' as _i5;
import 'package:shop_app/screens/home/home_wrapper.dart' as _i6;
import 'package:shop_app/screens/home/products/products_screen.dart' as _i8;
import 'package:shop_app/screens/home/settings/settings_screen.dart' as _i9;
import 'package:shop_app/screens/login/login_screen.dart' as _i7;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AddProductRoute.name: (routeData) {
      final args = routeData.argsAs<AddProductRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(
            child: _i1.AddProductScreen(
          key: args.key,
          hashedProducts: args.hashedProducts,
          selectedProducts: args.selectedProducts,
          onSubmit: args.onSubmit,
        )),
      );
    },
    AuthRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    CardsFormRoute.name: (routeData) {
      final args = routeData.argsAs<CardsFormRouteArgs>(
          orElse: () => const CardsFormRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(
            child: _i3.CardsFormScreen(
          key: args.key,
          card: args.card,
        )),
      );
    },
    CardsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(child: const _i4.CardsScreen()),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeWrapperScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(child: const _i7.LoginScreen()),
      );
    },
    ProductsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(child: const _i8.ProductsScreen()),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddProductScreen]
class AddProductRoute extends _i10.PageRouteInfo<AddProductRouteArgs> {
  AddProductRoute({
    _i11.Key? key,
    required Map<int, _i12.Product> hashedProducts,
    required List<_i12.Product> selectedProducts,
    required void Function(List<_i12.Product>) onSubmit,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          AddProductRoute.name,
          args: AddProductRouteArgs(
            key: key,
            hashedProducts: hashedProducts,
            selectedProducts: selectedProducts,
            onSubmit: onSubmit,
          ),
          initialChildren: children,
        );

  static const String name = 'AddProductRoute';

  static const _i10.PageInfo<AddProductRouteArgs> page =
      _i10.PageInfo<AddProductRouteArgs>(name);
}

class AddProductRouteArgs {
  const AddProductRouteArgs({
    this.key,
    required this.hashedProducts,
    required this.selectedProducts,
    required this.onSubmit,
  });

  final _i11.Key? key;

  final Map<int, _i12.Product> hashedProducts;

  final List<_i12.Product> selectedProducts;

  final void Function(List<_i12.Product>) onSubmit;

  @override
  String toString() {
    return 'AddProductRouteArgs{key: $key, hashedProducts: $hashedProducts, selectedProducts: $selectedProducts, onSubmit: $onSubmit}';
  }
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i10.PageRouteInfo<void> {
  const AuthRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CardsFormScreen]
class CardsFormRoute extends _i10.PageRouteInfo<CardsFormRouteArgs> {
  CardsFormRoute({
    _i11.Key? key,
    _i13.Card? card,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          CardsFormRoute.name,
          args: CardsFormRouteArgs(
            key: key,
            card: card,
          ),
          initialChildren: children,
        );

  static const String name = 'CardsFormRoute';

  static const _i10.PageInfo<CardsFormRouteArgs> page =
      _i10.PageInfo<CardsFormRouteArgs>(name);
}

class CardsFormRouteArgs {
  const CardsFormRouteArgs({
    this.key,
    this.card,
  });

  final _i11.Key? key;

  final _i13.Card? card;

  @override
  String toString() {
    return 'CardsFormRouteArgs{key: $key, card: $card}';
  }
}

/// generated route for
/// [_i4.CardsScreen]
class CardsRoute extends _i10.PageRouteInfo<void> {
  const CardsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CardsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeWrapperScreen]
class HomeRouter extends _i10.PageRouteInfo<void> {
  const HomeRouter({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouter';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProductsScreen]
class ProductsRoute extends _i10.PageRouteInfo<void> {
  const ProductsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SettingsScreen]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
