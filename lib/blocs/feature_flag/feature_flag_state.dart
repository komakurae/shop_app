part of 'feature_flag_bloc.dart';

@freezed
class FeatureFlagState with _$FeatureFlagState {
  const FeatureFlagState._();

  const factory FeatureFlagState({
    @Default([]) List<Flag> flags,
    @Default(FeatureFlagStatus.loading) FeatureFlagStatus status,
    Identity? identity,
  }) = _FeatureFlagState;

  bool isEnabled(String flagName) {
    final found = flags.firstWhereOrDefault(
      (value) =>
          value.feature.name == flagName &&
          ((value.enabled != null) && value.enabled! == true),
    );

    return found?.enabled ?? false;
  }
}

enum FeatureFlagStatus {
  loading,
  complete;
}
