import 'dart:async';

import 'package:flagsmith/flagsmith.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:shop_app/services/index.dart';

part 'feature_flag_event.dart';
part 'feature_flag_state.dart';
part 'feature_flag_bloc.freezed.dart';

@Singleton(scope: 'auth')
class FeatureFlagBloc extends Bloc<FeatureFlagEvent, FeatureFlagState> {
  final FeatureFlagClient featureFlagClient;

  late StreamSubscription<Flag> _subscription;

  FeatureFlagBloc({
    required this.featureFlagClient,
  }) : super(const FeatureFlagState()) {
    on<_Initialize>(_onInitFlag);
    on<_Load>(_onLoadFlags);
    on<_Register>(_onRegisterFlag);
    on<_ChangeIdentity>(_changeIdentityFlag);
  }

  @override
  Future<void> close() {
    _subscription.cancel();

    return super.close();
  }

  FutureOr<void> _onInitFlag(
    _Initialize event,
    Emitter<FeatureFlagState> emit,
  ) {
    emit(
      state.copyWith(
        status: FeatureFlagStatus.loading,
        identity: event.identity,
      ),
    );

    add(
      _Register(
        featureName: event.featureName,
      ),
    );
  }

  FutureOr<void> _onLoadFlags(
    _Load event,
    Emitter<FeatureFlagState> emit,
  ) async {
    emit(state.copyWith(status: FeatureFlagStatus.loading));

    final result = await featureFlagClient.getFlags(
      user: state.identity,
      reload: event.reload,
    );

    final newFlags = Map.fromEntries(state.flags.entries);

    for (final flag in result) {
      final featureFlag = FeatureFlag.getFromString(flag.feature.name);

      if (featureFlag == null) {
        continue;
      }

      newFlags[featureFlag] = flag.enabled ?? featureFlag.isEnableByDefault;
    }
    emit(
      state.copyWith(
        status: FeatureFlagStatus.complete,
        flags: newFlags,
      ),
    );
  }

  FutureOr<void> _onRegisterFlag(
    _Register event,
    Emitter<FeatureFlagState> emit,
  ) async {
    _subscription =
        featureFlagClient.stream(featureKey: event.featureName).listen((event) {
      add(const _Load(reload: false));
    });
    add(const _Load());
  }

  FutureOr<void> _changeIdentityFlag(
    _ChangeIdentity event,
    Emitter<FeatureFlagState> emit,
  ) {
    emit(
      state.copyWith(
        status: FeatureFlagStatus.loading,
        identity: event.identity,
      ),
    );
    add(const _Load());
  }
}
