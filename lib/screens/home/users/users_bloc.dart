import 'package:injectable/injectable.dart';

import 'package:shop_app/models/index.dart';
import 'package:shop_app/repositories/index.dart';

typedef UsersState = NetworkSearchableListState<UserProfile>;

@singleton
class UsersBloc extends NetworkSearchableListBloc<UserProfile, UsersState> {
  final UsersRepository repository;

  UsersBloc(this.repository)
      : super(
          const UsersState(
            data: [],
            visibleData: [],
          ),
        );

  @override
  Future<List<UserProfile>> onLoadAsync() {
    return repository.getAllUsers();
  }

  @override
  UsersState onStateChanged(DataChangeReason reason, UsersState state) {
    var visibleDate = state.data;

    if (state.query != null && state.query!.isNotEmpty) {
      visibleDate = visibleDate
          .where(
            (user) => RegExp(state.query!, caseSensitive: false)
                .hasMatch(user.username),
          )
          .toList();
    }

    return state.copyWith(visibleData: visibleDate);
  }

  @override
  bool equals(UserProfile item1, UserProfile item2) {
    return item1.id == item2.id;
  }
}
