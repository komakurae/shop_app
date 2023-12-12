import 'package:injectable/injectable.dart';

import 'package:shop_app/models/product/models.dart';
import 'package:shop_app/services/http/http_client.dart';

@injectable
class ProductsRepository {
  final HttpClient httpClient;

  ProductsRepository(this.httpClient);

  String get endpointUrl => '/products';

  Future<Product> createProduct(Product product) async {
    final response = await httpClient.post(
      endpointUrl,
      data: product.toJson(),
    );

    return Product.fromJson(response.data);
  }

  Future<List<Product>> getAllProducts() async {
    final response = await httpClient.get(endpointUrl);

    return (response.data as List)
        .map<Product>((jsonProduct) => Product.fromJson(jsonProduct))
        .toList();
  }

  Future<Product> updateProduct(Product product) async {
    final response = await httpClient.put(
      endpointUrl,
      data: product.toJson(),
    );

    return Product.fromJson(response.data);
  }

  // CATEGORIES METHODS

  Future<List<Category>> getAllCategories() async {
    final response = await httpClient.get('$endpointUrl/categories');

    return (response.data as List)
        .map(
          (jsonCategory) => Category.fromJson(jsonCategory),
        )
        .toList()
      ..add(Category.none);
  }
}
