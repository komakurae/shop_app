import 'package:flagsmith/flagsmith.dart';
import 'package:shop_app/core/constants/env_constants.dart';

class FeatureFlagClient {
  static late FlagsmithClient _flagsmith;

  static Future<FeatureFlagClient> init() async {
    _flagsmith = await FlagsmithClient.init(
      apiKey: EnvConstants.appFlagsmithKey,
    );
    await _flagsmith.getFeatureFlags();

    return FeatureFlagClient();
  }

  Stream<Flag> stream({required String featureKey}) =>
      _flagsmith.stream(featureKey) ?? const Stream.empty();

  Future<bool> isFeatureEnabled({
    required String featureName,
    Identity? user,
  }) =>
      _flagsmith.isFeatureFlagEnabled(
        featureName,
        user: user,
      );

  Future<bool> featureExists({
    required String featureName,
    Identity? user,
  }) =>
      _flagsmith.hasFeatureFlag(
        featureName,
        user: user,
      );

  Future<List<Flag>> getFlags({
    bool reload = true,
    Identity? user,
  }) =>
      _flagsmith.getFeatureFlags(
        reload: reload,
        user: user,
      );
}
