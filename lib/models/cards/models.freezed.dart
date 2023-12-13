// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Card _$CardFromJson(Map<String, dynamic> json) {
  return _Card.fromJson(json);
}

/// @nodoc
mixin _$Card {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  List<CardProduct> get products => throw _privateConstructorUsedError;
  int get v => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardCopyWith<Card> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardCopyWith<$Res> {
  factory $CardCopyWith(Card value, $Res Function(Card) then) =
      _$CardCopyWithImpl<$Res, Card>;
  @useResult
  $Res call(
      {int id, int userId, DateTime? date, List<CardProduct> products, int v});
}

/// @nodoc
class _$CardCopyWithImpl<$Res, $Val extends Card>
    implements $CardCopyWith<$Res> {
  _$CardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = freezed,
    Object? products = null,
    Object? v = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CardProduct>,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardImplCopyWith<$Res> implements $CardCopyWith<$Res> {
  factory _$$CardImplCopyWith(
          _$CardImpl value, $Res Function(_$CardImpl) then) =
      __$$CardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, int userId, DateTime? date, List<CardProduct> products, int v});
}

/// @nodoc
class __$$CardImplCopyWithImpl<$Res>
    extends _$CardCopyWithImpl<$Res, _$CardImpl>
    implements _$$CardImplCopyWith<$Res> {
  __$$CardImplCopyWithImpl(_$CardImpl _value, $Res Function(_$CardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = freezed,
    Object? products = null,
    Object? v = null,
  }) {
    return _then(_$CardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CardProduct>,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardImpl implements _Card {
  const _$CardImpl(
      {this.id = 0,
      this.userId = 0,
      this.date,
      final List<CardProduct> products = const [],
      this.v = 0})
      : _products = products;

  factory _$CardImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int userId;
  @override
  final DateTime? date;
  final List<CardProduct> _products;
  @override
  @JsonKey()
  List<CardProduct> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey()
  final int v;

  @override
  String toString() {
    return 'Card(id: $id, userId: $userId, date: $date, products: $products, v: $v)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.v, v) || other.v == v));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, date,
      const DeepCollectionEquality().hash(_products), v);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardImplCopyWith<_$CardImpl> get copyWith =>
      __$$CardImplCopyWithImpl<_$CardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardImplToJson(
      this,
    );
  }
}

abstract class _Card implements Card {
  const factory _Card(
      {final int id,
      final int userId,
      final DateTime? date,
      final List<CardProduct> products,
      final int v}) = _$CardImpl;

  factory _Card.fromJson(Map<String, dynamic> json) = _$CardImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  DateTime? get date;
  @override
  List<CardProduct> get products;
  @override
  int get v;
  @override
  @JsonKey(ignore: true)
  _$$CardImplCopyWith<_$CardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CardProduct _$CardProductFromJson(Map<String, dynamic> json) {
  return _CardProduct.fromJson(json);
}

/// @nodoc
mixin _$CardProduct {
  int get productId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardProductCopyWith<CardProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardProductCopyWith<$Res> {
  factory $CardProductCopyWith(
          CardProduct value, $Res Function(CardProduct) then) =
      _$CardProductCopyWithImpl<$Res, CardProduct>;
  @useResult
  $Res call({int productId, int quantity});
}

/// @nodoc
class _$CardProductCopyWithImpl<$Res, $Val extends CardProduct>
    implements $CardProductCopyWith<$Res> {
  _$CardProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardProductImplCopyWith<$Res>
    implements $CardProductCopyWith<$Res> {
  factory _$$CardProductImplCopyWith(
          _$CardProductImpl value, $Res Function(_$CardProductImpl) then) =
      __$$CardProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int productId, int quantity});
}

/// @nodoc
class __$$CardProductImplCopyWithImpl<$Res>
    extends _$CardProductCopyWithImpl<$Res, _$CardProductImpl>
    implements _$$CardProductImplCopyWith<$Res> {
  __$$CardProductImplCopyWithImpl(
      _$CardProductImpl _value, $Res Function(_$CardProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
  }) {
    return _then(_$CardProductImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardProductImpl implements _CardProduct {
  const _$CardProductImpl({this.productId = 0, this.quantity = 0});

  factory _$CardProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardProductImplFromJson(json);

  @override
  @JsonKey()
  final int productId;
  @override
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'CardProduct(productId: $productId, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardProductImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardProductImplCopyWith<_$CardProductImpl> get copyWith =>
      __$$CardProductImplCopyWithImpl<_$CardProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardProductImplToJson(
      this,
    );
  }
}

abstract class _CardProduct implements CardProduct {
  const factory _CardProduct({final int productId, final int quantity}) =
      _$CardProductImpl;

  factory _CardProduct.fromJson(Map<String, dynamic> json) =
      _$CardProductImpl.fromJson;

  @override
  int get productId;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$CardProductImplCopyWith<_$CardProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
