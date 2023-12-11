import 'package:injectable/injectable.dart';
import 'package:stx_bloc_base/stx_bloc_base.dart';
import 'package:tuple/tuple.dart';

import 'package:shop_app/models/product/models.dart';
import 'package:shop_app/repositories/products_repository.dart';

typedef ProductsState
    = NetworkFilterableExtraState<List<Product>, Category, List<Category>>;

@lazySingleton
class ProductsBloc
    extends NetworkFilterableListBloc<Product, Category, ProductsState>
    with
        NetworkExtraBaseMixin<List<Product>, List<Category>, ProductsState>,
        NetworkExtraBlocMixin<List<Product>, List<Category>, ProductsState> {
  ProductsBloc({
    required this.repository,
  }) : super(
          const ProductsState(
            data: [],
            visibleData: [],
            extraData: [],
          ),
        ) {
    super.network();
  }

  final ProductsRepository repository;

  @override
  bool equals(Product item1, Product item2) {
    return item1.id == item2.id;
  }

  @override
  Future<Tuple2<List<Product>, List<Category>>> onLoadWithExtraAsync() async {
    final response = await Future.wait([
      repository.getAllProducts(),
      repository.getAllCategories(),
    ]);

    return Tuple2(response[0] as List<Product>, response[1] as List<Category>);
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

    if (state.filter != null && state.filter != Category.none) {
      visibleData = visibleData
          .where((product) => product.category == state.filter)
          .toList();
    } else if (state.filter == Category.none) {
      state.copyWith(visibleData: state.data);
    }

    return state.copyWith(visibleData: visibleData);
  }
}
