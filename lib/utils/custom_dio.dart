import 'package:dio/dio.dart';

Dio customDio() {
  final Dio dio = Dio(BaseOptions(
      baseUrl: "https://recarga-te.com/",
      contentType: "application/json"
  ));

  // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
  //   client.badCertificateCallback=(X509Certificate cert, String host, int port){
  //     return true;
  //   };
  // };
  return dio;
}
