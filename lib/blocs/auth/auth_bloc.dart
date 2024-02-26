import 'dart:async';

import 'package:flagsmith/flagsmith.dart' as fs;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:injectable/injectable.dart';

import 'package:shop_app/blocs/feature_flag/feature_flag_bloc.dart';
import 'package:shop_app/models/index.dart';
import 'package:shop_app/repositories/index.dart';
import 'package:shop_app/services/feature_flag/feature_flag.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@Singleton(scope: 'auth')
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final UsersRepository userRepository;

  final FeatureFlagBloc featureFlagBloc;

  late StreamSubscription<AuthenticationStatus> _subscription;

  AuthBloc({
    required this.authRepository,
    required this.userRepository,
    required this.featureFlagBloc,
  }) : super(const AuthState()) {
    _subscription = authRepository.authenticationStatus.listen((status) {
      add(AuthEvent.authenticationStatusChanged(status));
    });

    on<_AuthenticationStatusChanged>(_authenticationStatusChanged);
    on<_SignOut>(_signOut);
  }

  FutureOr<void> _authenticationStatusChanged(
    _AuthenticationStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    if (event.status == AuthenticationStatus.authenticated) {
      try {
        // hardcoded value
        final userProfile = await userRepository.getUserProfileById(
          2,
        ); // for id = 1 feature disabled, for id = 2 enabled

        featureFlagBloc.add(
          FeatureFlagEvent.initialize(
            featureName: FeatureFlag.cartsTab.featureName,
            identity: fs.Identity(identifier: userProfile.email),
          ),
        );

        await featureFlagBloc.stream.firstWhere(
          (state) => state.status == FeatureFlagStatus.complete,
        );

        emit(AuthState.authenticated(userProfile));
      } catch (_) {
        emit(AuthState.unauthenticated());
      }
    } else {
      emit(
        state.copyWith(
          status: event.status,
          userProfile: const UserProfile(),
        ),
      );
    }
  }

  FutureOr<void> _signOut(_SignOut event, Emitter<AuthState> emit) {
    return authRepository.signOut();
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
