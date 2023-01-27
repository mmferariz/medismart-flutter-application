import 'dart:io';

import 'package:dio/dio.dart';
import 'package:remind_pills/utils/custom_error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';
import '../utils/custom_dio.dart';

class Request{

  final Dio _dio = customDio();

  Future<Map<String, dynamic>> login(String email, String password) async{
    Response response = await _dio.post(
      "/auth/local",
      data: {
        "identifier": email,
        "password": password
      },
    );
    return { "user": User.fromJson(response.data["user"]), "jwt": response.data["jwt"] };
  }
  
  Future<Map<String, dynamic>> register(User user) async{
    Response response = await _dio.post(
      "/auth/local/register",
      data: user.toJson(),
    );
    return { "user": User.fromJson(response.data["user"]), "jwt": response.data["jwt"] };
  }
  
  Future<User> getInfoUser(String? token) async{
    if(token == null){
      throw CustomError(code: 403, message: "Not token device");
    }
    Response response = await _dio.get(
      "/users/me?populate[0]=recetas&populate[1]=recetas.medicamentos",
      options: Options(
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token"
        }
      )
    );
    return User.fromJson(response.data);
  }
 
  Future<User> base() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = await sp.getString("token");
    Response response = await _dio.get(
      "/users/me?populate=*",
      options: Options(
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token"
        }
      )
    );
    return User.fromJson(response.data);
  }

}