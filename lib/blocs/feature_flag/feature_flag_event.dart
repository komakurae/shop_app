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
  const factory FeatureFlagEvent.load({
    @Default(true) bool reload,
  }) = _Load;

  const factory FeatureFlagEvent.changeIdentity({
    Identity? identity,
  }) = _ChangeIdentity;
}
