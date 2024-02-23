import 'dart:async';

import 'package:darq/darq.dart';
import 'package:flagsmith/flagsmith.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:shop_app/services/feature_flag/feature_flag_client.dart';

part 'feature_flag_event.dart';
part 'feature_flag_state.dart';
part 'feature_flag_bloc.freezed.dart';

@singleton
class FeatureFlagBloc extends Bloc<FeatureFlagEvent, FeatureFlagState> {
  final FeatureFlagClient featureFlagClient;

  late StreamSubscription<Flag> _subscription;

  FeatureFlagBloc({
    required this.featureFlagClient,
  }) : super(const FeatureFlagState()) {
    on<_Initialize>(_onInitFlag);
    on<_Fetch>(_onFetchFlag);
    on<_Reload>(_onReloadFlag);
    on<_Register>(_onRegisterFlag);
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

  FutureOr<void> _onFetchFlag(
    _Fetch event,
    Emitter<FeatureFlagState> emit,
  ) async {
    emit(state.copyWith(status: FeatureFlagStatus.loading));

    final result = await featureFlagClient.getFlags(
      user: state.identity,
    );

    emit(
      state.copyWith(
        status: FeatureFlagStatus.complete,
        flags: result,
      ),
    );
  }

  FutureOr<void> _onReloadFlag(
    _Reload event,
    Emitter<FeatureFlagState> emit,
  ) async {
    emit(state.copyWith(status: FeatureFlagStatus.loading));

    final result = await featureFlagClient.getFlags(
      reload: false,
      user: state.identity,
    );

    emit(
      state.copyWith(
        status: FeatureFlagStatus.complete,
        flags: result,
      ),
    );
  }

  FutureOr<void> _onRegisterFlag(
    _Register event,
    Emitter<FeatureFlagState> emit,
  ) async {
    _subscription =
        featureFlagClient.stream(featureKey: event.featureName).listen((event) {
      add(const _Reload());
    });
    add(const _Fetch());
  }
}
