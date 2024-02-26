import 'package:darq/darq.dart';

enum FeatureFlag {
  cartsTab(
    featureName: 'carts_tab',
    isEnableByDefault: true,
  );

  const FeatureFlag({
    required this.featureName,
    required this.isEnableByDefault,
  });

  static FeatureFlag? getFromString(String name) {
    return FeatureFlag.values.firstWhereOrDefault(
      (feature) => feature.featureName == name,
    );
  }

  final String featureName;
  final bool isEnableByDefault;
}
