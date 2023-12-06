// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'models.freezed.dart';
part 'models.g.dart';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    @Default(Address()) Address address,
    @Default(0) int id,
    @Default('') String email,
    @Default('') String username,
    @Default('') String password,
    @Default(Name()) Name name,
    @Default('') String phone,
    // what is v?
    @Default(0) int v,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    @Default(Geolocation()) Geolocation geolocation,
    @Default('') String city,
    @Default('') String street,
    @Default(1) int number,
    @Default('') String zipcode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
class Geolocation with _$Geolocation {
  const factory Geolocation({
    @Default('') String lat,
    @Default('') String long,
  }) = _Geolocation;

  factory Geolocation.fromJson(Map<String, dynamic> json) =>
      _$GeolocationFromJson(json);
}

@freezed
class Name with _$Name {
  const factory Name({
    @Default('') String firstname,
    @Default('') String lastname,
  }) = _Name;

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}
