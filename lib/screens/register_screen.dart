import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
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
  String gender = 'hombre';
  late SingletonBloc _singletonBloc;

  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _apPaCtrl = TextEditingController();
  TextEditingController _apMaCtrl = TextEditingController();
  TextEditingController _dateCtrl = TextEditingController();

  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();


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
                        labelText: "Nombre Completo",
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        controller: _nameCtrl,
                        regex: Regex.notEmpty,
                        errorMessage: "Ingresa un valor",
                      ),
                      CustomTextField(
                        labelText: "Apellido Materno",
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        controller: _apMaCtrl,
                        regex: Regex.notEmpty,
                        errorMessage: "Ingresa un valor",
                      ),
                      CustomTextField(
                        labelText: "Apellido Paterno",
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        controller: _apPaCtrl,
                        regex: Regex.notEmpty,
                        errorMessage: "Ingresa un valor",
                      ),
                      CustomTextField(
                        labelText: "Correo",
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        controller: _emailCtrl,
                        regex: Regex.email,
                        errorMessage: "Ingresa un correo correcto",
                      ),Column(children: <Widget>[
                        Text("Genero"),
                        RadioListTile<String>(
                          title: const Text('Hombre'),
                          value: 'hombre',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Mujer'),
                          value: 'mujer',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                            });
                          },
                        )
                      ]),
                      CustomTextField(
                        labelText: "Telefono",
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        controller: _mobileCtrl,
                        regex: Regex.phone,
                        errorMessage: "Ingresa un numero correctamente",
                      ),
                      TextFormField(
                          controller: _dateCtrl,
                          decoration: const InputDecoration(
                            labelText: 'Fecha de nacimiento',
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate:DateTime(2000),
                                lastDate: DateTime(2101)
                            );
                            if(pickedDate != null ){
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                              setState(() {
                                _dateCtrl.text = formattedDate;
                              });
                            }else{
                              print("Date is not selected");
                            }
                          }
                      ),
                      CustomTextField(
                        labelText: "Contraseña",
                        textInputType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
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
      showLoadDialog(context);
      try {
        Navigator.of(context).pop();
        //User user = await _singletonBloc.login(_txtName.text, _txtPass.text);
        //_singletonBloc.sinkUser.add(user);
        //await showLoadDialog(context, "Inicio exitoso", ResponseTypes.Success);
        Navigator.pushNamed(context, "/expediente");
      } on CustomError catch (e) {
        showResponseDialog(context, e.message ?? "Ocurrió un error desconocido", ResponseType.Failed);
      } catch (e) {
        showResponseDialog(context, "Ocurrió un error desconocido", ResponseType.Failed);
      }
    }
  }
}
