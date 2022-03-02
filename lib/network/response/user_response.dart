import 'dart:convert';

import 'package:facebook_clone/network/entity/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';
@JsonSerializable()
class UserResponse {
  final int id;

  final String name;
  
  final String username;

  final String email;

  final AddressEntity address;

  final String phone;

  final String website;

  final CompanyEntity company;

  static List<UserResponse> fromJsonArray(String str) {
      return (jsonDecode(str) as List)
        .map((json) => UserResponse.fromJson(json))
        .toList();
          }

  UserResponse(this.id, this.name, this.username, this.email, this.address, this.phone, this.website, this.company);
  
  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

}
