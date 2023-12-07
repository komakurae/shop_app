import 'package:injectable/injectable.dart';
import 'package:shop_app/models/product/models.dart';
import 'package:shop_app/repositories/products_repository.dart';
import 'package:stx_bloc_base/stx_bloc_base.dart';

typedef ProductsState = NetworkSearchableState<List<Product>>;

@LazySingleton()
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
    final products = await repository.getAllProducts();

    return products;
  }

  @override
  ProductsState onStateChanged(
    DataChangeReason reason,
    ProductsState state,
  ) {
    final visibleData = state.data;

    if (state.query != null && state.query!.isNotEmpty) {
      final searchedData = visibleData
          .where(
            (product) => RegExp(state.query!).hasMatch(product.title),
          )
          .toList();

      return state.copyWith(
        visibleData: searchedData,
      );
    } else if (state.query == null || state.query!.isEmpty) {
      return state.copyWith(
        visibleData: visibleData,
      );
    }

    return super.onStateChanged(reason, state);
  }
}
