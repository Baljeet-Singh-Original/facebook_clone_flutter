
// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:dio/dio.dart';
import 'package:facebook_clone/network/response/post_response.dart';
import 'package:retrofit/http.dart';
import 'package:facebook_clone/network/response/user_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class ApiService {
  factory ApiService(Dio dio){
    dio.options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
      contentType: 'application/json',
      headers: {
        'Content-Type': 'application/json'
      }
    );

    return _ApiService(dio);
  }
  @GET('/users')
  Future<List<UserResponse>> userProfiles ()  ;

  @GET("/posts?userId={userId}")
  Future<List<PostResponse>> userPosts (@Path("userId") int userId);
}