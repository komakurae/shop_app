import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/blocs/index.dart';
import 'package:shop_app/services/index.dart';

class HomeStateWrapper extends StatelessWidget {
  const HomeStateWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<FeatureFlagBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CartsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProductsBloc>(),
        ),
      ],
      child: child,
    );
  }
}
