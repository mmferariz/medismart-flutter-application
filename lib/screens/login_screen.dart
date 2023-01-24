import 'package:flutter/material.dart';
import 'package:remind_pills/forgot_password.dart';
import 'package:flutter/cupertino.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Usuario',
                      ),
                    ),
                      TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contraseña',
                      ),
                    )
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
                  onTap: (){
                    print(nameController.text);
                    print(passwordController.toString());
                  },child: Container(
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
}