enum Feature {
  cartsTab,
}

extension FeatureX on Feature {
  String get id => switch (this) {
        Feature.cartsTab => 'carts_tab',
      };
}
