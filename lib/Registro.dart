import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:remind_pills/LoginScreen.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> keyForm = new GlobalKey();
  TextEditingController  nameCtrl = new TextEditingController();
  TextEditingController  apPaCtrl = new TextEditingController();
  TextEditingController  apMaCtrl = new TextEditingController();
  TextEditingController dateCtrl =new TextEditingController() ;
  TextEditingController  emailCtrl = new TextEditingController();
  TextEditingController  mobileCtrl = new TextEditingController();
  TextEditingController  passwordCtrl = new TextEditingController();
  TextEditingController  repeatPassCtrl = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Registrarse'),
          backgroundColor: CupertinoColors.activeBlue.highContrastColor,
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.fromLTRB(25,10,25,10),
            child: new Form(
              key: keyForm,
              child: formUI(),
            ),
          ),
        ),
      ),
    );
  }

  formItemsDesign(icon, item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Card(child: ListTile(leading: Icon(icon), title: item)),
    );
  }

  String gender = 'hombre';
  Widget formUI() {
    return  Column(
        children: <Widget>[
        formItemsDesign(
        Icons.person,
        TextFormField(
            controller: nameCtrl,
            decoration: new InputDecoration(
                label: Text.rich(

                  TextSpan(
                   children: <InlineSpan>[
                     WidgetSpan(child: Text('Nombres')),
                     WidgetSpan(child: Text('*')),
                   ] ,
                  )
                ),
              ),
                validator: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
            )),
        formItemsDesign(
            Icons.person,
            TextFormField(
              controller: apPaCtrl,
              decoration: new InputDecoration(
                label: Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(child: Text('Apellidos')),
                        WidgetSpan(child: Text('*')),
                      ] ,
                    )
                ),
              ),
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            )),
        formItemsDesign(
            Icons.calendar_today,
            TextFormField(
              controller: dateCtrl,
              decoration: new InputDecoration(
                label: Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(child: Text('Fecha de nacimiento')),
                        WidgetSpan(child: Text('*')),
                      ] ,
                    )
                ),
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
                  dateCtrl.text = formattedDate;
                });
              }else{
              print("Date is not selected");
              }
              }
            )),
        formItemsDesign(
            Icons.phone,
            TextFormField(
              controller: mobileCtrl,
              decoration: new InputDecoration(
                label: Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(child: Text('Telefono')),
                        WidgetSpan(child: Text('*')),
                      ] ,
                    )
                ),
              ),
              keyboardType: TextInputType.phone,
              maxLength: 10,
              )),
        formItemsDesign(
            Icons.transgender,
            Column(children: <Widget>[
              Text("Genero*"),
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
            ])),
        formItemsDesign(
            Icons.email,
            TextFormField(
              controller: emailCtrl,
              decoration: new InputDecoration(
                labelText: 'Email*',
              ),
              keyboardType: TextInputType.emailAddress,
              maxLength: 32,
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
             )),
        formItemsDesign(
            Icons.remove_red_eye,
            TextFormField(
              controller: passwordCtrl,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña*',
              ),
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            )),
        formItemsDesign(
            Icons.remove_red_eye,
            TextFormField(
              controller: repeatPassCtrl,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Repetir la Contraseña*',
              ),
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
             // validator: validatePassword,
            )),
        GestureDetector(
            onTap: (){//guardar
              print(nameCtrl.text);
              print(gender.toString());
            },child: Container(
          margin: new EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            gradient: LinearGradient(colors: [
              Color(0xFF0EDE),
              Color(0xFF03A0FE),
            ],
                begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Text("Guardar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 50,
        )),
        GestureDetector(
            onTap: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>  MyApp(),
                ),
              );//cancelar
            },child: Container(

          margin: new EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            gradient: LinearGradient(colors: [
              Colors.deepOrangeAccent,
              Colors.red,
            ],
                begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Text("Cancelar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 50,
        ))
      ],
    );
  }

  String? validatePassword(String value) {
    print("valorrr $value passsword ${passwordCtrl.text}");
    if (value != passwordCtrl.text) {
      return "Las contraseñas no coinciden";
    }
    return null;
  }

  String? validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El nombre es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "El nombre debe de ser a-z y A-Z";
    }
    return null;
  }

  String? validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "El telefono es necesariod";
    } else if (value.length != 10) {
      return "El numero debe tener 10 digitos";
    }
    return null;
  }

  String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El correo es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "Correo invalido";
    } else {
      return null;
    }
  }
}