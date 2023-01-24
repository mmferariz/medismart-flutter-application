
import 'package:dio/dio.dart';

customErrorHandler(Object e){
  if(e is DioError){
    if(e.response!.data["mensaje"] == "Su sesión ha expirado, favor de cerrar su sesión actual e iniciar nuevamente"){
      // UserBloc()..logout()..dispose();
    }
    throw CustomError(message: e.response!.data["mensaje"] as String, code: e.response!.statusCode);
  } 
  print(e);
  throw CustomError(message: "Error desconocido.", code: 0);
}

class CustomError{

  final String? message;
  final int? code;

  CustomError({this.message, this.code});

}