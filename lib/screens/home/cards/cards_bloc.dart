import 'package:flutter/material.dart' hide Card;

import 'package:injectable/injectable.dart';

import 'package:shop_app/models/cards/models.dart';
import 'package:shop_app/models/index.dart';
import 'package:shop_app/repositories/cards_repository.dart';

typedef CardsState = NetworkFilterableState<List<Card>, DateTimeRange>;

@lazySingleton
class CardsBloc
    extends NetworkFilterableListBloc<Card, DateTimeRange, CardsState> {
  CardsBloc({required this.repository})
      : super(
          const CardsState(
            data: [],
            visibleData: [],
          ),
        );

  final CardsRepository repository;

  @override
  bool equals(Card item1, Card item2) {
    return item1.id == item2.id;
  }

  @override
  Future<List<Card>> onFilterAsync(DateTimeRange filter) {
    return repository.getCardsInDateRange(start: filter.start, end: filter.end);
  }

  @override
  Future<List<Card>> onLoadAsync() {
    return repository.getAllCards();
  }
}
