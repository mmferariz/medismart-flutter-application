import 'package:flutter/material.dart';
import 'package:remind_pills/screens/cita_paciente_screen.dart';
import 'package:remind_pills/forgot_password.dart';
import 'package:remind_pills/screens/citas_screen.dart';
import 'package:remind_pills/screens/expediente_paciente_screen.dart';
import 'package:remind_pills/screens/login_screen.dart';
import 'package:remind_pills/screens/register_screen.dart';
import 'package:remind_pills/splash_screen.dart';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  //Flujo principal
  '/': (context) => SplashScreen(),
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
  '/forgotpass': (context) => ForgotPassword(),
  '/expediente': (context) => ExpedientePaciente(),
  '/registrarCita':(context) => CitaPaciente(),
  '/citas':(context) => CitasScreen()
};
