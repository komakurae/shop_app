part of 'feature_flag_bloc.dart';

@freezed
class FeatureFlagState with _$FeatureFlagState {
  const FeatureFlagState._();

  const factory FeatureFlagState({
    @Default({}) Map<String, bool> flags,
    @Default(FeatureFlagStatus.loading) FeatureFlagStatus status,
    Identity? identity,
  }) = _FeatureFlagState;

  bool isEnabled(String flagName) => flags[flagName] ?? false;
}

enum FeatureFlagStatus {
  loading,
  complete;
}
