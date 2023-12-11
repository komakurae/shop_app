import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @Default(0) int id,
    @Default('') String title,
    @Default(0.0) double price,
    @Default('') String description,
    @Default(Category.none) Category category,
    @Default('') String image,
    @Default(Rating()) Rating rating,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

enum Category {
  none('none'),
  electronics('electronics'),
  jewelery('jewelery'),
  @JsonValue("men's clothing")
  mensClothing("men's clothing"),
  @JsonValue("women's clothing")
  womensClothing("women's clothing");

  final String label;

  const Category(this.label);

  factory Category.fromJson(String json) {
    switch (json) {
      case 'electronics':
        return Category.electronics;
      case 'jewelery':
        return Category.jewelery;
      case "men's clothing":
        return Category.mensClothing;
      case "women's clothing":
        return Category.womensClothing;
      default:
        return Category.none;
    }
  }
}

@freezed
class Rating with _$Rating {
  const factory Rating({
    @Default(0.0) double rate,
    @Default(0) int count,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}
