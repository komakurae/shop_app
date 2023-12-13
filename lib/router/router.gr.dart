// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:shop_app/models/index.dart' as _i13;
import 'package:shop_app/screens/auth_screen.dart' as _i1;
import 'package:shop_app/screens/home/home_screen.dart' as _i4;
import 'package:shop_app/screens/home/home_wrapper.dart' as _i5;
import 'package:shop_app/screens/home/messages/chats/chats_screen.dart' as _i3;
import 'package:shop_app/screens/home/messages/chats/pages/chat_details/chat_details_screen.dart'
    as _i2;
import 'package:shop_app/screens/home/messages/messages_screen.dart' as _i7;
import 'package:shop_app/screens/home/messages/posts/posts_screen.dart' as _i8;
import 'package:shop_app/screens/home/products/products_screen.dart' as _i9;
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
    ChatDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ChatDetailsRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ChatDetailsScreen(
          key: args.key,
          chat: args.chat,
        ),
      );
    },
    ChatsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i3.ChatsScreen()),
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
    MessagesRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MessagesScreen(),
      );
    },
    PostsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i8.PostsScreen()),
      );
    },
    ProductsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i9.ProductsScreen()),
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
/// [_i2.ChatDetailsScreen]
class ChatDetailsRoute extends _i11.PageRouteInfo<ChatDetailsRouteArgs> {
  ChatDetailsRoute({
    _i12.Key? key,
    required _i13.Chat chat,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ChatDetailsRoute.name,
          args: ChatDetailsRouteArgs(
            key: key,
            chat: chat,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatDetailsRoute';

  static const _i11.PageInfo<ChatDetailsRouteArgs> page =
      _i11.PageInfo<ChatDetailsRouteArgs>(name);
}

class ChatDetailsRouteArgs {
  const ChatDetailsRouteArgs({
    this.key,
    required this.chat,
  });

  final _i12.Key? key;

  final _i13.Chat chat;

  @override
  String toString() {
    return 'ChatDetailsRouteArgs{key: $key, chat: $chat}';
  }
}

/// generated route for
/// [_i3.ChatsScreen]
class ChatsRoute extends _i11.PageRouteInfo<void> {
  const ChatsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ChatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatsRoute';

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
/// [_i7.MessagesScreen]
class MessagesRoute extends _i11.PageRouteInfo<void> {
  const MessagesRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MessagesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MessagesRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PostsScreen]
class PostsRoute extends _i11.PageRouteInfo<void> {
  const PostsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          PostsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProductsScreen]
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
