import 'package:injectable/injectable.dart';

import 'package:shop_app/models/index.dart';
import 'package:shop_app/services/http/http_client.dart';
import 'package:shop_app/services/index.dart';

@Injectable(scope: 'auth')
class UserRepository {
  final HttpClient httpClient;

  UserRepository(this.httpClient);

  String get endpointUrl => '/users';

  Future<UserProfile> getUserProfileById(int id) async {
    final response = await httpClient.get('$endpointUrl/$id');
    final responseData = response.data as DynamicMap;

    return UserProfile.fromJson(responseData);
  }
}
