import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Card with _$Card {
  const factory Card({
    @Default(0) int id,
    @Default(0) int userId,
    DateTime? date,
    @Default([]) List<CardProduct> products,
    @Default(0) int v,
  }) = _Card;

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
}

@freezed
class CardProduct with _$CardProduct {
  const factory CardProduct({
    @Default(0) int productId,
    @Default(0) int quantity,
  }) = _CardProduct;

  factory CardProduct.fromJson(Map<String, dynamic> json) =>
      _$CardProductFromJson(json);
}
