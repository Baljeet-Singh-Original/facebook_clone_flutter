import 'package:json_annotation/json_annotation.dart';

part 'post_response.g.dart';

@JsonSerializable()
class PostResponse {
  final int userId;

  final int id;

  final String title;
  
  final String body;

  PostResponse(this.userId, this.id, this.title, this.body);

  factory PostResponse.fromJson(Map<String, dynamic> json) => _$PostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PostResponseToJson(this);

}
