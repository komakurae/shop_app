import 'package:injectable/injectable.dart';
import 'package:shop_app/models/cart/models.dart';

import 'carts_repository.dart';

@Environment('userMode')
@Injectable(as: CartsRepository)
class UserCartRepository extends CartsRepository {
  UserCartRepository(
    super.httpClient, {
    @Named('userId') required this.userId,
  });

  final int userId;

  @override
  Future<List<Cart>> getAllCarts() async {
    final response = await httpClient.get('$endpointUrl/user/$userId');

    return (response.data as List)
        .map((jsonCart) => Cart.fromJson(jsonCart))
        .toList();
  }
}
