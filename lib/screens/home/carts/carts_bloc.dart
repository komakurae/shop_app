import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';

import 'package:shop_app/models/index.dart';
import 'package:shop_app/repositories/carts_repository.dart';

typedef CartsState = NetworkFilterableState<List<Cart>, DateTimeRange>;

@lazySingleton
class CartsBloc
    extends NetworkFilterableListBloc<Cart, DateTimeRange, CartsState> {
  CartsBloc({required this.repository})
      : super(
          const CartsState(
            data: [],
            visibleData: [],
          ),
        );

  final CartsRepository repository;

  @override
  Future<List<Cart>> onLoadAsync() {
    return repository.getAllCarts();
  }

  @override
  Future<Cart> onAddItemAsync(Cart newItem) {
    return repository.createCart(newItem);
  }

  @override
  Future<Cart> onEditItemAsync(Cart updatedItem) {
    return repository.updateCart(updatedItem);
  }

  @override
  Future<List<Cart>> onFilterAsync(DateTimeRange filter) {
    return repository.getCartsInDateRange(start: filter.start, end: filter.end);
  }

  @override
  bool equals(Cart item1, Cart item2) {
    return item1.id == item2.id;
  }
}
