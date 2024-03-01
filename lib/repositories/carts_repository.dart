import 'package:injectable/injectable.dart';

import 'package:shop_app/core/extensions/date_time_extension.dart';
import 'package:shop_app/models/cart/models.dart';
import 'package:shop_app/services/http/http_client.dart';

@injectable
class CartsRepository {
  final HttpClient httpClient;

  CartsRepository(this.httpClient);

  String get endpoint => '/carts';

  Future<Cart> createCart(Cart payload) async {
    final response = await httpClient.post(
      endpoint,
      data: payload.toJson(),
    );
    return Cart.fromJson(response.data);
  }

  Future<List<Cart>> getAllCarts() async {
    final response = await httpClient.get(endpoint);

    return (response.data as List)
        .map((jsonCart) => Cart.fromJson(jsonCart))
        .toList();
  }

  Future<List<Cart>> getCartsInDateRange({
    required DateTime start,
    required DateTime end,
  }) async {
    final response = await httpClient.get(
      endpoint,
      queryParameters: {
        'startdate': start.format(),
        'enddate': end.format(),
      },
    );

    return (response.data as List)
        .map((jsonCart) => Cart.fromJson(jsonCart))
        .toList();
  }

  Future<Cart> updateCart(Cart payload) async {
    final response = await httpClient.put(
      '$endpoint/${payload.id}',
      data: payload.toJson(),
    );

    return Cart.fromJson(response.data);
  }
}
