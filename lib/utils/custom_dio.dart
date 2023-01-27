import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:remind_pills/utils/config.dart';

Dio customDio() {
  final Dio dio = Dio(BaseOptions(
      baseUrl: "${Config.baseUrl}/api",
      contentType: "application/json"
  ));

  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
    client.badCertificateCallback=(X509Certificate cert, String host, int port){
      return true;
    };
  };
  return dio;
}
