import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';


@JsonSerializable()
class AddressEntity {
  final String street;

  final String suite;

  final String city;

  final String zipcode;


  AddressEntity(this.street, this.suite, this.city, this.zipcode);

  factory AddressEntity.fromJson(Map<String, dynamic> json) => _$AddressEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AddressEntityToJson(this);
}


@JsonSerializable()
class CompanyEntity {
  final String name;

  final String catchPhrase;

  final String bs;

  CompanyEntity(this.name, this.catchPhrase, this.bs);
  
  factory CompanyEntity.fromJson(Map<String, dynamic> json) => _$CompanyEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyEntityToJson(this);

}