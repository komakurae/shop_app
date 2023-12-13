// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardImpl _$$CardImplFromJson(Map<String, dynamic> json) => _$CardImpl(
      id: json['id'] as int? ?? 0,
      userId: json['userId'] as int? ?? 0,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => CardProduct.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      v: json['v'] as int? ?? 0,
    );

Map<String, dynamic> _$$CardImplToJson(_$CardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date?.toIso8601String(),
      'products': instance.products,
      'v': instance.v,
    };

_$CardProductImpl _$$CardProductImplFromJson(Map<String, dynamic> json) =>
    _$CardProductImpl(
      productId: json['productId'] as int? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
    );

Map<String, dynamic> _$$CardProductImplToJson(_$CardProductImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
    };
