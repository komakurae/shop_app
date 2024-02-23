// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? '',
      category: json['category'] == null
          ? Category.none
          : Category.fromJson(json['category'] as String),
      image: json['image'] as String? ?? '',
      rating: json['rating'] == null
          ? const Rating()
          : Rating.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': _$CategoryEnumMap[instance.category]!,
      'image': instance.image,
      'rating': instance.rating,
    };

const _$CategoryEnumMap = {
  Category.none: 'none',
  Category.electronics: 'electronics',
  Category.jewelery: 'jewelery',
  Category.mensClothing: "men's clothing",
  Category.womensClothing: "women's clothing",
};

_$RatingImpl _$$RatingImplFromJson(Map<String, dynamic> json) => _$RatingImpl(
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      count: json['count'] as int? ?? 0,
    );

Map<String, dynamic> _$$RatingImplToJson(_$RatingImpl instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
