// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      address: json['address'] == null
          ? const Address()
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      username: json['username'] as String? ?? '',
      password: json['password'] as String? ?? '',
      name: json['name'] == null
          ? const Name()
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      phone: json['phone'] as String? ?? '',
      v: json['v'] as int? ?? 0,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'phone': instance.phone,
      'v': instance.v,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      geolocation: json['geolocation'] == null
          ? const Geolocation()
          : Geolocation.fromJson(json['geolocation'] as Map<String, dynamic>),
      city: json['city'] as String? ?? '',
      street: json['street'] as String? ?? '',
      number: json['number'] as int? ?? 1,
      zipcode: json['zipcode'] as String? ?? '',
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'geolocation': instance.geolocation,
      'city': instance.city,
      'street': instance.street,
      'number': instance.number,
      'zipcode': instance.zipcode,
    };

_$GeolocationImpl _$$GeolocationImplFromJson(Map<String, dynamic> json) =>
    _$GeolocationImpl(
      lat: json['lat'] as String? ?? '',
      long: json['long'] as String? ?? '',
    );

Map<String, dynamic> _$$GeolocationImplToJson(_$GeolocationImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };

_$NameImpl _$$NameImplFromJson(Map<String, dynamic> json) => _$NameImpl(
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
    );

Map<String, dynamic> _$$NameImplToJson(_$NameImpl instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };
