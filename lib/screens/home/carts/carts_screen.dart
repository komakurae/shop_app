import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/blocs/index.dart';
import 'package:shop_app/core/extensions/date_time_extension.dart';
import 'package:shop_app/localization/index.dart';
import 'package:shop_app/models/index.dart';
import 'package:shop_app/router/index.dart';
import 'package:shop_app/screens/home/carts/widgets/cart_item.dart';

@RoutePage()
class CartsScreen extends StatelessWidget implements AutoRouteWrapper {
  const CartsScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<CartsBloc>().load();

    return this;
  }

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);

    final cardsBloc = context.read<CartsBloc>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushRoute(CartsFormRoute()),
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return cardsBloc.loadAsyncFuture();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Cards'),
              floating: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Row(
                  children: [
                    BlocSelector<CartsBloc, CartsState, DateTimeRange?>(
                      selector: (state) {
                        return state.filter;
                      },
                      builder: (context, filter) {
                        final currentDateTime = DateTime.now();
                        var label = 'Filter by date range';

                        if (filter != null) {
                          final formattedStartDateTime =
                              filter.start.format('yyyy.MM.dd');
                          final formattedEndDateTime =
                              filter.end.format('yyyy.MM.dd');
                          label =
                              '$formattedStartDateTime-$formattedEndDateTime';
                        }
                        return ElevatedButton.icon(
                          icon: const Icon(Icons.date_range),
                          label: Text(label),
                          onPressed: () async {
                            final userSelectedTimeRange =
                                await showDateRangePicker(
                              context: context,
                              firstDate: DateTime(currentDateTime.year - 4),
                              lastDate: currentDateTime,
                              initialDateRange: filter,
                            );
                            if (userSelectedTimeRange != null) {
                              cardsBloc.filterAsync(userSelectedTimeRange);
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<CartsBloc, CartsState>(
              builder: (context, state) {
                switch (state.status) {
                  case NetworkStatus.initial:
                  case NetworkStatus.loading:
                    return const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case NetworkStatus.success:
                    final cards = state.visibleData;

                    if (cards.isEmpty) {
                      return const SliverFillRemaining(
                        child: Center(
                          child: Text('No cards found'),
                        ),
                      );
                    }

                    return SliverPadding(
                      padding: const EdgeInsets.all(10),
                      sliver: SliverGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1 / 1.3,
                        children: cards
                            .map(
                              (cart) => GestureDetector(
                                onTap: () {
                                  context.router.push(
                                    CartsFormRoute(cart: cart),
                                  );
                                },
                                child: CartItem(cart: cart),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  case NetworkStatus.failure:
                    return SliverFillRemaining(
                      child: ColoredBox(
                        color: Colors.red,
                        child: Center(
                          child: Text(state.errorMsg),
                        ),
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
