import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:remind_pills/LoginScreen.dart';
class recetaDoctor extends StatefulWidget {
  @override
  _RecetaDoctor createState() => _RecetaDoctor();
}

class _RecetaDoctor extends State<recetaDoctor> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Registrar receta'),
          backgroundColor:CupertinoColors.activeBlue.highContrastColor,
        ),
        body: new SingleChildScrollView(
            child: new Container(
              margin: new EdgeInsets.all(25.0),
            )
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://concepto.de/wp-content/uploads/2018/08/persona-e1533759204552.jpg'),
                ),
                accountEmail: Text('jane.doe@example.com'),
                accountName: Text(
                  ' Dr. Jane Doe',
                  style: TextStyle(fontSize: 24.0),
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.link,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.medical_information_rounded),
                title: const Text(
                  'Registrar receta',
                  style: TextStyle(fontSize: 24.0),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>  recetaDoctor(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.apartment),
                title: const Text(
                  'Cerrar Sesion',
                  style: TextStyle(fontSize: 24.0),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>  MyApp(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}