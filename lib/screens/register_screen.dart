import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:remind_pills/model/user.dart';
import 'package:remind_pills/utils/custom_error_handler.dart';
import 'package:remind_pills/bloc/bloc.dart';
import 'package:remind_pills/utils/regex.dart';
import 'package:remind_pills/widgets/custom_response_dialog.dart';
import 'package:remind_pills/widgets/load_dialog.dart';

import '../bloc/bloc.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _key = GlobalKey();
  late SingletonBloc _singletonBloc;

  String gender = 'Masculino';
  DateTime? birthDate;
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _usernameCtrl = TextEditingController();
  final TextEditingController _dateCtrl = TextEditingController();
  final TextEditingController _apeCtrl = TextEditingController();

  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _mobileCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();


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
                    'Registrar',
                    style: TextStyle(fontSize: 20),
                  )
              ),
              Form(
                  key: _key,
                  child: Column(
                    children: [
                      CustomTextField(
                        labelText: "Nombre de usuario",
                        textInputType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        controller: _usernameCtrl,
                        regex: Regex.notEmpty,
                        errorMessage: "Ingresa un valor",
                      ),
                      CustomTextField(
                        labelText: "Nombre Completo",
                        textInputType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        controller: _nameCtrl,
                        regex: Regex.notEmpty,
                        errorMessage: "Ingresa un valor",
                      ),
                      CustomTextField(
                        labelText: "Apellidos",
                        textInputType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        controller: _apeCtrl,
                        regex: Regex.notEmpty,
                        errorMessage: "Ingresa un valor",
                      ),
                      CustomTextField(
                        labelText: "Correo",
                        textInputType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        controller: _emailCtrl,
                        regex: Regex.email,
                        errorMessage: "Ingresa un correo valido",
                      ),
                      Column(children: [
                        Text(
                          "Genero",
                          style: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 16,
                            fontWeight: FontWeight.w500)
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: RadioListTile<String>(
                                title: const Text('Masculino'),
                                value: 'Masculino',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value!;
                                  });
                                },
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: RadioListTile<String>(
                                title: const Text('Femenino'),
                                value: 'Femenino',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value!;
                                  });
                                },
                              ),
                            )
                          ],
                        )
                      ]),
                      CustomTextField(
                        labelText: "Telefono",
                        textInputType: TextInputType.phone,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        controller: _mobileCtrl,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 20),
                        child: TextFormField(
                          controller: _dateCtrl,
                            decoration: const InputDecoration(
                              labelText: 'Fecha de nacimiento',
                            ),
                            readOnly: true,
                            onTap: () async {
                              birthDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate:DateTime(2000),
                                  lastDate: DateTime(2101)
                              );
                              if(birthDate != null ){
                                String formattedDate = DateFormat('yyyy-MM-dd').format(birthDate!); // format date in required form here we use yyyy-MM-dd that means time is removed
                                  _dateCtrl.text = formattedDate;
                              }
                            }
                        ),
                      ),
                      CustomTextField(
                        labelText: "Contraseña",
                        textInputType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textCapitalization: TextCapitalization.none,
                        isPassword: true,
                        controller: _passwordCtrl,
                        regex: Regex.password,
                        errorMessage: "La contraseña debe contener por lo menos 6 caracteres",
                      ),
                    ],
                  )
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
                    child: const Text("Registrar",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    height: 50,
                  )),
            ],
          )),
    );
  }
  validateForm(BuildContext context) async {
    if(_key.currentState!.validate()){
      if(birthDate == null){
        await showResponseDialog(context, "Selecciona tu fecha de nacimiento", ResponseType.Failed);
        return;
      }
      showLoadDialog(context);
      try {
        final user = User(
          nombre: _nameCtrl.text,
          apellidos: _apeCtrl.text,
          gender: gender,
          fechaNacimiento: birthDate,
          username: _usernameCtrl.text,
          email: _emailCtrl.text,
          password: _passwordCtrl.text
        );
        Navigator.of(context).pop();
        final res = await _singletonBloc.register(user);
        _singletonBloc.sinkUser.add(res);
        await showResponseDialog(context, "Registro exitoso", ResponseType.Success);
        Navigator.pushNamed(context, "/expediente");
      } on CustomError catch (e) {
        showResponseDialog(context, e.message ?? "Ocurrió un error desconocido", ResponseType.Failed);
      } catch (e) {
        showResponseDialog(context, "Ocurrió un error desconocido", ResponseType.Failed);
      }
    }
  }
}
