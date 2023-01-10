import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:remind_pills/LoginScreen.dart';

class ForgotPassword extends StatefulWidget {
@override
_ForgotPassword createState() => _ForgotPassword();
}
class _ForgotPassword extends State<ForgotPassword> {
GlobalKey<FormState> keyForm = new GlobalKey();
TextEditingController correoCtrl = new TextEditingController();

@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text('Recuperar contraseña'),
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
Widget formUI() {
  return  Column(
    children: <Widget>[
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Ingrese su correo :',
            style: TextStyle(fontSize: 20),
          )),
      formItemsDesign(
          Icons.email,
          TextFormField(
            controller: correoCtrl,
            decoration: new InputDecoration(
              labelText: 'Email',
            ),
            validator: (value){
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ) ),
      GestureDetector(
          onTap: (){

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
        child: Text("Enviar",
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
            );
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
