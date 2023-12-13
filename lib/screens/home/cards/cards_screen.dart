import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/localization/index.dart';
import 'package:shop_app/models/index.dart';
import 'package:shop_app/router/index.dart';
import 'package:shop_app/screens/home/cards/cards_bloc.dart';
import 'package:shop_app/screens/home/cards/widgets/card_item.dart';

@RoutePage()
class CardsScreen extends StatelessWidget implements AutoRouteWrapper {
  const CardsScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<CardsBloc>().load();

    return this;
  }

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);

    final cardsBloc = context.read<CardsBloc>();

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return cardsBloc.loadAsyncFuture();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
                        final selectedDateRange = await showDateRangePicker(
                          context: context,
                          // dont like it, ask
                          firstDate: DateTime(2019, 12, 10),
                          lastDate: DateTime.now(),
                        );
                        // maybe there is a better way
                        if (selectedDateRange != null) {
                          cardsBloc.filterAsync(selectedDateRange);
                        }
                      },
                      icon: const Icon(Icons.date_range),
                      label: const Text('Choose date range'),
                    )
                  ],
                ),
              ),
              title: const Text('Cards'),
            ),
            BlocBuilder<CardsBloc, CardsState>(
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
                              (card) => CardItem(card: card),
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
