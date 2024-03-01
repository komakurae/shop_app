import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:shop_app/blocs/index.dart';
import 'package:shop_app/localization/index.dart';
import 'package:shop_app/router/index.dart';
import 'package:shop_app/screens/home/carts/modals/select_user/select_user_provider.dart';

@RoutePage()
class SelectUserScreen extends StatelessWidget implements AutoRouteWrapper {
  const SelectUserScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    final bloc = context.read<UsersBloc>();

    return ChangeNotifierProvider(
      create: (context) => SelectUserProvider(bloc)..init(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);

    return Material(
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
              onChanged: (value) {
                context.read<SelectUserProvider>().searchUserByUsername(value);
              },
            ),
          ),
          Consumer<SelectUserProvider>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return SliverPadding(
                  padding: const EdgeInsets.all(10),
                  sliver: SliverList.builder(
                    itemCount: value.visibleData.length,
                    itemBuilder: (context, index) {
                      final user = value.visibleData[index];

                      return GestureDetector(
                        onTap: () {
                          context.popRoute(user);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          color: Colors.amber.shade100,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(user.username),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
