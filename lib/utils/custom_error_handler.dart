
import 'package:dio/dio.dart';

customErrorHandler(Object e){
  if(e is DioError){
    if(e.response!.data["mensaje"] == "Su sesión ha expirado, favor de cerrar su sesión actual e iniciar nuevamente"){
      // UserBloc()..logout()..dispose();
    }
    final error = e.response!.data["error"];
    return CustomError(message: error["message"] as String, code: e.response!.statusCode);
  } 
  print(e);
  return CustomError(message: "Error desconocido.", code: 0);
}

class CustomError{

  final String? message;
  final int? code;

  CustomError({this.message, this.code});

}