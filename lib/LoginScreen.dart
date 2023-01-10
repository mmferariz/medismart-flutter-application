import 'package:flutter/material.dart';
import 'package:remind_pills/ForgotPassword.dart';
import 'package:remind_pills/Registro.dart';
import 'package:remind_pills/citaPaciente.dart';
import 'package:remind_pills/expedientePaciente.dart';
import 'package:remind_pills/citaPaciente.dart';
import 'package:flutter/cupertino.dart';
import 'package:remind_pills/recetaDoctor.dart';
import 'package:remind_pills/registroDoctor.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'MediSmart';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),
          backgroundColor: CupertinoColors.activeBlue.highContrastColor,),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Usuario',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>  ForgotPassword(),
                  ),
                );
              },
              child: const Text('Olvido la contraseña',),
            ),
            GestureDetector(
                onTap: (){
                  print(nameController.text);
                  print(passwordController.toString());
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
              child: Text("Login",
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> RegisterDoctor())
                    )
                    //signup screen
                  },
                )
              ],
            ),
          ],
        ));
  }
}