import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/blocs/index.dart';
import 'package:shop_app/localization/index.dart';
import 'package:shop_app/models/index.dart';
import 'package:shop_app/router/index.dart';

@RoutePage()
class SelectUserScreen extends StatelessWidget implements AutoRouteWrapper {
  const SelectUserScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<UsersBloc>().load();

    return this;
  }

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);

    final usersBloc = context.read<UsersBloc>();

    return Material(
      child: RefreshIndicator(
        onRefresh: () {
          return usersBloc.loadAsyncFuture();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              automaticallyImplyLeading: false,
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
                      return GestureDetector(
                        onTap: () {
                          context.router.pop<UserProfile?>(users[index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          color: Colors.amber.shade100,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(users[index].username),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
