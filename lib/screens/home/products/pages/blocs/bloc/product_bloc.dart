import 'package:injectable/injectable.dart';

import 'package:shop_app/models/index.dart';
import 'package:shop_app/models/product/models.dart';
import 'package:shop_app/repositories/index.dart';

typedef ProductState = NetworkState<Product>;

@injectable
class ProductBloc extends NetworkBloc<Product, ProductState> {
  ProductBloc({
    required this.repository,
    @factoryParam required this.id,
  }) : super(
          const ProductState(
            data: Product(),
          ),
        );

  final ProductsRepository repository;

  final int id;

  @override
  Future<Product> onLoadAsync() async {
    final product = repository.getProductById(id);

    return product;
  }
}
