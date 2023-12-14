import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/extensions/date_time_extension.dart';
import 'package:shop_app/localization/index.dart';
import 'package:shop_app/models/index.dart';
import 'package:shop_app/router/index.dart';
import 'package:shop_app/screens/home/cards/cards_bloc.dart';
import 'package:shop_app/screens/home/cards/widgets/card_item.dart';

@RoutePage()
class CardsScreen extends StatefulWidget implements AutoRouteWrapper {
  const CardsScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<CardsBloc>().load();

    return this;
  }

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  final currentDateTime = DateTime.now();

  late final initialDateTimeRange = DateTimeRange(
    start: DateTime(currentDateTime.year - 4),
    end: currentDateTime,
  );

  late ValueNotifier<DateTimeRange> selectedDateTimeRange;

  @override
  void initState() {
    selectedDateTimeRange = ValueNotifier(
      initialDateTimeRange,
    );

    super.initState();
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
              title: const Text('Cards'),
              floating: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: selectedDateTimeRange,
                      builder: (context, value, child) {
                        return ElevatedButton.icon(
                          icon: const Icon(Icons.date_range),
                          label: Text(
                            '${value.start.format('yyyy.MM.dd')}-${value.end.format('yyyy.MM.dd')}',
                          ),
                          onPressed: () async {
                            final userSelectedTimeRange =
                                await showDateRangePicker(
                              context: context,
                              firstDate: initialDateTimeRange.start,
                              lastDate: initialDateTimeRange.end,
                            );
                            if (userSelectedTimeRange != null) {
                              selectedDateTimeRange.value =
                                  userSelectedTimeRange;
                              cardsBloc
                                  .filterAsync(selectedDateTimeRange.value);
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
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
