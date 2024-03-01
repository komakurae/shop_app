import 'package:flutter/widgets.dart';

import 'package:shop_app/blocs/index.dart';
import 'package:shop_app/models/index.dart';

class SelectUserProvider with ChangeNotifier {
  final UsersBloc usersBloc;

  List<UserProfile> data = [];
  List<UserProfile> visibleData = [];

  bool isLoading = true;

  SelectUserProvider(this.usersBloc);

  Future<void> init() async {
    isLoading = true;
    notifyListeners();

    await usersBloc.initLoadAsyncFuture();

    data = usersBloc.state.data;
    visibleData = data;

    isLoading = false;
    notifyListeners();
  }

  void searchUserByUsername(String username) {
    visibleData = data
        .where(
          (userProfile) => RegExp(username, caseSensitive: false)
              .hasMatch(userProfile.username),
        )
        .toList();
    notifyListeners();
  }
}
