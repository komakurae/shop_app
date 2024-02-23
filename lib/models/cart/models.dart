import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Cart with _$Cart {
  const factory Cart({
    @Default(0) int id,
    @Default(0) int userId,
    DateTime? date,
    @Default([]) List<CartProduct> products,
    @Default(0) int v,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@freezed
class CartProduct with _$CartProduct {
  const factory CartProduct({
    @Default(0) int productId,
    @Default(0) int quantity,
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);
}
