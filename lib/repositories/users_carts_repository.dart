import 'package:injectable/injectable.dart';

import 'package:shop_app/repositories/index.dart';

@Environment('userMode')
@Injectable(as: UsersRepository, scope: 'auth')
class UserCartRepository extends UsersRepository {
  UserCartRepository(super.httpClient);
}
