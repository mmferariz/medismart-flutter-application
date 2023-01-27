import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:remind_pills/forgot_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:remind_pills/utils/custom_error_handler.dart';
import 'package:remind_pills/utils/regex.dart';
import 'package:remind_pills/widgets/custom_response_dialog.dart';
import 'package:remind_pills/widgets/load_dialog.dart';

import '../bloc/bloc.dart';
import '../model/user.dart';
import '../widgets/custom_text_field.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _key = GlobalKey();
  
  late SingletonBloc _singletonBloc;

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _singletonBloc = BlocProvider.of<SingletonBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("MediSmart"),
      backgroundColor: CupertinoColors.activeBlue.highContrastColor,),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Image(
                    image: AssetImage('assets/images/logo.png'),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Iniciar Sesion',
                    style: TextStyle(fontSize: 20),
                  )
                ),
              
              Form(
                key: _key,
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: "Usuario o correo",
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      controller: _txtName,
                      regex: Regex.notEmpty,
                      errorMessage: "Ingresa un usuario o correo valido",
                    ),
                    CustomTextField(
                      labelText: "Usuario o correo",
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      isPassword: true,
                      controller: _txtPass,
                      regex: Regex.password,
                      errorMessage: "La contraseña debe contener por lo menos 6 caracteres",
                    ),
                  ],
                )
              ),
              
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/forgotpass");
                },
                child: const Text('Olvido la contraseña',),
              ),
              GestureDetector(
                  onTap: () => validateForm(context),
                  child: Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  gradient: LinearGradient(colors: [
                    Color(0x6FA8DC),
                    Color(0xFF03A0FE),
                  ],
                      begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: const Text("Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 50,
              )),
              Row(
                children: <Widget>[
                  const Text('No tienes cuenta?'),
                  TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: ()=> {
                      Navigator.pushNamed(context, "/expediente")
                      //signup screen
                    },
                  )
                ],
              ),
            ],
          )),
    );
  }
  
  validateForm(BuildContext context) async {
    if(_key.currentState!.validate()){
      showLoadDialog(context);
      try {
        Navigator.of(context).pop();
        User user = await _singletonBloc.login(_txtName.text, _txtPass.text);
        _singletonBloc.sinkUser.add(user);
        await showResponseDialog(context, "Inicio exitoso", ResponseType.Success);
        Navigator.pushNamed(context, "/expediente");
      } on CustomError catch (e) {
        showResponseDialog(context, e.message ?? "Ocurrió un error desconocido", ResponseType.Failed);
      } catch (e) {
        showResponseDialog(context, "Ocurrió un error desconocido", ResponseType.Failed);
      }
    }
  }
}