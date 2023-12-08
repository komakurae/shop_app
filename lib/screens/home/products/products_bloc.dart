import 'package:injectable/injectable.dart';
import 'package:stx_bloc_base/stx_bloc_base.dart';

import 'package:shop_app/models/product/models.dart';
import 'package:shop_app/repositories/products_repository.dart';

typedef ProductsState = NetworkSearchableState<List<Product>>;

@lazySingleton
class ProductsBloc extends NetworkSearchableListBloc<Product, ProductsState> {
  ProductsBloc({
    required this.repository,
  }) : super(
          const ProductsState(
            data: [],
            visibleData: [],
          ),
        );

  final ProductsRepository repository;

  @override
  bool equals(Product item1, Product item2) {
    return item1.id == item2.id;
  }

  @override
  Future<List<Product>> onLoadAsync() async {
    final products = repository.getAllProducts();

    return products;
  }

  @override
  ProductsState onStateChanged(
    DataChangeReason reason,
    ProductsState state,
  ) {
    var visibleData = state.data;

    if (state.query != null && state.query!.isNotEmpty) {
      visibleData = visibleData
          .where(
            (product) => RegExp(state.query!).hasMatch(product.title),
          )
          .toList();
    }

    return state.copyWith(visibleData: visibleData);
  }
}
