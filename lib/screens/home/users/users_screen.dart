import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/router/index.dart';
import 'package:shop_app/screens/home/users/users_bloc.dart';

@RoutePage()
class UsersScreen extends StatelessWidget implements AutoRouteWrapper {
  const UsersScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<UsersBloc>().load();

    return this;
  }

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);

    final usersBloc = context.read<UsersBloc>();

    return RefreshIndicator(
      onRefresh: () {
        return usersBloc.loadAsyncFuture();
      },
      child: CustomScrollView(slivers: [
        SliverAppBar(
          floating: true,
          title: TextField(
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white70,
              suffixIcon: Icon(Icons.search),
            ),
            onSubmitted: (value) {
              usersBloc.search(value);
            },
          ),
        ),
        BlocBuilder<UsersBloc, UsersState>(
          builder: (context, state) {
            if (state.status.isLoading || state.status.isInitial) {
              return const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state.status.isFailure) {
              return SliverFillRemaining(
                child: ColoredBox(
                  color: Colors.red,
                  child: Center(
                    child: Text(state.errorMsg),
                  ),
                ),
              );
            }

            final users = state.visibleData;

            return SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverList.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Text(users[index].username);
                },
              ),
            );
          },
        ),
      ]),
    );
  }
}
