enum Feature {
  cartsTab(
    featureName: 'carts_tab',
    isEnableByDefault: true,
  );

  const Feature({
    required this.featureName,
    required this.isEnableByDefault,
  });

  final String featureName;
  final bool isEnableByDefault;
}
