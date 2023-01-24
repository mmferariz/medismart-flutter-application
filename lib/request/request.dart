import 'dart:io';

import 'package:dio/dio.dart';

import '../utils/custom_dio.dart';

class Request{

  Dio _dio = customDio();

  Future<String?> checkOut() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = await sp.getString("token");
    Response response = await _dio.post(
      "checkOut",
      data: "",
      options: Options(
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $token"
        }
      )
    );
    if(response.data["mensaje"] != null) return response.data["mensaje"];
    if(response.data["message"] != null) return response.data["message"];
    return null;
  }

}