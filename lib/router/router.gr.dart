// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:shop_app/models/cart/models.dart' as _i13;
import 'package:shop_app/screens/auth_screen.dart' as _i1;
import 'package:shop_app/screens/home/carts/carts_screen.dart' as _i3;
import 'package:shop_app/screens/home/carts/modals/cart_form_screen.dart'
    as _i2;
import 'package:shop_app/screens/home/home_screen.dart' as _i4;
import 'package:shop_app/screens/home/home_wrapper.dart' as _i5;
import 'package:shop_app/screens/home/products/pages/product_screen.dart'
    as _i7;
import 'package:shop_app/screens/home/products/products_screen.dart' as _i8;
import 'package:shop_app/screens/home/products/products_wrapper.dart' as _i9;
import 'package:shop_app/screens/home/settings/settings_screen.dart' as _i10;
import 'package:shop_app/screens/login/login_screen.dart' as _i6;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthScreen(),
      );
    },
    CartsFormRoute.name: (routeData) {
      final args = routeData.argsAs<CartsFormRouteArgs>(
          orElse: () => const CartsFormRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(
            child: _i2.CartsFormScreen(
          key: args.key,
          cart: args.cart,
        )),
      );
    },
    CartsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i3.CartsScreen()),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeWrapperScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i6.LoginScreen()),
      );
    },
    ProductRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductRouteArgs>(
          orElse: () => ProductRouteArgs(productId: pathParams.optInt('id')));
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(
            child: _i7.ProductScreen(
          key: args.key,
          productId: args.productId,
        )),
      );
    },
    ProductsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i8.ProductsScreen()),
      );
    },
    ProductsRouter.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ProductsWrapper(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i11.PageRouteInfo<void> {
  const AuthRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CartsFormScreen]
class CartsFormRoute extends _i11.PageRouteInfo<CartsFormRouteArgs> {
  CartsFormRoute({
    _i12.Key? key,
    _i13.Cart? cart,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          CartsFormRoute.name,
          args: CartsFormRouteArgs(
            key: key,
            cart: cart,
          ),
          initialChildren: children,
        );

  static const String name = 'CartsFormRoute';

  static const _i11.PageInfo<CartsFormRouteArgs> page =
      _i11.PageInfo<CartsFormRouteArgs>(name);
}

class CartsFormRouteArgs {
  const CartsFormRouteArgs({
    this.key,
    this.cart,
  });

  final _i12.Key? key;

  final _i13.Cart? cart;

  @override
  String toString() {
    return 'CartsFormRouteArgs{key: $key, cart: $cart}';
  }
}

/// generated route for
/// [_i3.CartsScreen]
class CartsRoute extends _i11.PageRouteInfo<void> {
  const CartsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CartsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeWrapperScreen]
class HomeRouter extends _i11.PageRouteInfo<void> {
  const HomeRouter({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouter';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProductScreen]
class ProductRoute extends _i11.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i12.Key? key,
    int? productId,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            productId: productId,
          ),
          rawPathParams: {'id': productId},
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const _i11.PageInfo<ProductRouteArgs> page =
      _i11.PageInfo<ProductRouteArgs>(name);
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    this.productId,
  });

  final _i12.Key? key;

  final int? productId;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i8.ProductsScreen]
class ProductsRoute extends _i11.PageRouteInfo<void> {
  const ProductsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProductsWrapper]
class ProductsRouter extends _i11.PageRouteInfo<void> {
  const ProductsRouter({List<_i11.PageRouteInfo>? children})
      : super(
          ProductsRouter.name,
          initialChildren: children,
        );

  static const String name = 'ProductsRouter';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SettingsScreen]
class SettingsRoute extends _i11.PageRouteInfo<void> {
  const SettingsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
