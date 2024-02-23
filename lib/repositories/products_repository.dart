import 'package:injectable/injectable.dart';

import 'package:shop_app/models/product/models.dart';
import 'package:shop_app/services/http/http_client.dart';

@injectable
class ProductsRepository {
  final HttpClient httpClient;

  ProductsRepository(this.httpClient);

  String get productsEndpointUrl => '/products';

  Future<List<Product>> getAllProducts() async {
    final response = await httpClient.get(productsEndpointUrl);

    return (response.data as List)
        .map<Product>((jsonProduct) => Product.fromJson(jsonProduct))
        .toList();
  }

  Future<Product> getProductById(int id) async {
    final response = await httpClient.get('$productsEndpointUrl/$id');

    return Product.fromJson(response.data);
  }

  Future<List<Category>> getAllCategories() async {
    final response = await httpClient.get('$productsEndpointUrl/categories');

    return (response.data as List)
        .map(
          (jsonCategory) => Category.fromJson(jsonCategory),
        )
        .toList()
      ..add(Category.none);
  }
}
