import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/blocs/index.dart';

import 'package:shop_app/screens/home/carts/carts_screen.dart';
import 'package:shop_app/services/index.dart';

@RoutePage()
class UserCartsScreen extends StatelessWidget implements AutoRouteWrapper {
  const UserCartsScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CartsBloc>()..load(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const CartsScreen();
  }
}
