part of 'feature_flag_bloc.dart';

@freezed
class FeatureFlagEvent with _$FeatureFlagEvent {
  const factory FeatureFlagEvent.initialize({
    required String featureName,
    Identity? identity,
  }) = _Initialize;
  const factory FeatureFlagEvent.register({
    required String featureName,
  }) = _Register;
  const factory FeatureFlagEvent.fetch() = _Fetch;
  const factory FeatureFlagEvent.reload() = _Reload;
}
