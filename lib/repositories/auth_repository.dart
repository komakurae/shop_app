import 'package:fresh_dio/fresh_dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_app/models/general_models.dart';

import 'package:shop_app/services/http/http_client.dart';

@Injectable(scope: 'auth')
class AuthRepository {
  final HttpClient httpClient;

  AuthRepository(this.httpClient);

  Stream<AuthenticationStatus> get authenticationStatus =>
      httpClient.authenticationStatus;

  String get endpointUrl => '/auth';

  Future<void> signIn(String userName, String password) async {
    final response = await httpClient.post(
      '$endpointUrl/login',
      data: <String, String>{
        'username': userName,
        'password': password,
      },
    );
    final responseData = response.data as DynamicMap;
    final token = responseData['token'];

    return httpClient.setToken(token);
  }

  Future<void> signOut() {
    return httpClient.clearToken();
  }
}
