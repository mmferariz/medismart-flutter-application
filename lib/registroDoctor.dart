import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class RegisterDoctor extends StatefulWidget {
  @override
  _RegisterDoctorState createState() => _RegisterDoctorState();
}

class _RegisterDoctorState extends State<RegisterDoctor> {
  GlobalKey<FormState> keyForm = new GlobalKey();
  TextEditingController nameCtrl = new TextEditingController();
  TextEditingController apPaCtrl = new TextEditingController();
  TextEditingController apMaCtrl = new TextEditingController();
  TextEditingController dateCtrl = new TextEditingController();

  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController mobileCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();
  TextEditingController repeatPassCtrl = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Registrar Doctor'),
          backgroundColor: CupertinoColors.activeBlue.highContrastColor,
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.fromLTRB(25, 10, 25, 10),
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
            Icons.school,
            TextFormField(
              controller: apPaCtrl,
              decoration: new InputDecoration(
                label: Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(child: Text('Especialidad')),
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
            Icons.account_balance_sharp,
            TextFormField(
              controller: apPaCtrl,
              decoration: new InputDecoration(
                label: Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(child: Text('Cedula')),
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
            },child: Container(
          margin: new EdgeInsets.all(20),
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
          child: Text("Guardar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 50,
        )),
        GestureDetector(
            onTap: (){//cancelar
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
}