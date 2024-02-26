part of 'feature_flag_bloc.dart';

@freezed
class FeatureFlagState with _$FeatureFlagState {
  const FeatureFlagState._();

  const factory FeatureFlagState({
    @Default({}) Map<FeatureFlag, bool> flags,
    @Default(FeatureFlagStatus.loading) FeatureFlagStatus status,
    Identity? identity,
  }) = _FeatureFlagState;

  bool isEnabled(FeatureFlag featureFlag) {
    return flags[featureFlag] ?? featureFlag.isEnableByDefault;
  }
}

enum FeatureFlagStatus {
  loading,
  complete;
}
