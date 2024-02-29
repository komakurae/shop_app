import 'package:injectable/injectable.dart';

import 'package:shop_app/models/index.dart';
import 'package:shop_app/services/http/http_client.dart';
import 'package:shop_app/services/index.dart';

@Environment('me')
@Injectable(scope: 'auth')
class UsersRepository {
  final HttpClient httpClient;

  UsersRepository(this.httpClient);

  String get endpointUrl => '/users';

  Future<List<UserProfile>> getAllUsers() async {
    final response = await httpClient.get(endpointUrl);

    return (response.data as List)
        .map<UserProfile>((jsonUser) => UserProfile.fromJson(jsonUser))
        .toList();
  }

  Future<UserProfile> getUserProfileById(int id) async {
    final response = await httpClient.get('$endpointUrl/$id');
    final responseData = response.data as DynamicMap;

    return UserProfile.fromJson(responseData);
  }
}
