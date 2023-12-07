import 'package:injectable/injectable.dart';
import 'package:shop_app/models/product/models.dart';
import 'package:shop_app/services/http/http_client.dart';

@injectable
class ProductsRepository {
  final HttpClient httpClient;

  ProductsRepository(this.httpClient);

  String get endpointUrl => '/products';

  Future<List<Product>> getAllProducts() async {
    final response = await httpClient.get(endpointUrl);
    // dont like it/ how to cast that
    final responseData = response.data as List;
    final products = responseData
        .map<Product>((jsonProduct) => Product.fromJson(jsonProduct))
        .toList();

    return products;
  }
}
