import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:remind_pills/cita_paciente.dart';

class ExpedientePaciente extends StatefulWidget {
  const ExpedientePaciente({Key? key}) : super(key: key);

  @override
  _ExpedienteCliente createState() => _ExpedienteCliente();
}

class _ExpedienteCliente extends State<ExpedientePaciente> {
  GlobalKey<FormState> keyForm = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expediente'),
           backgroundColor: CupertinoColors.activeBlue.highContrastColor,
        ),
        body: ListView(
          children: <Widget>[
            miCardImage(),
            miCard(),
            miCardRecetas(),
          ],
        ),
        drawer: Drawer(
          child:Container(color:CupertinoColors.white,
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
                  'Jane Doe',
                  style: TextStyle(fontSize: 24.0),
                ),
                decoration: BoxDecoration(
                  color: CupertinoColors.link,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.medical_information_rounded),
                title: const Text(
                  'Expediente',
                  style: TextStyle(fontSize: 24.0),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>  ExpedientePaciente(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.apartment),
                title: const Text(
                  'Registrar cita',
                  style: TextStyle(fontSize: 24.0),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const CitaPaciente(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.apartment),
                title: const Text(
                  'Cerrar sesion',
                  style: TextStyle(fontSize: 24.0),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/login");
                },
              ),
            ],
          ),
      ),
        ),
      );
  }


  Card miCardImage() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          Image(
            image: NetworkImage(
                'https://concepto.de/wp-content/uploads/2018/08/persona-e1533759204552.jpg'),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Luis Antonio Perez'),
          ),
        ],
      ),
    );
  }

  Card miCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text('Informacion Personal'),
            subtitle: Text(
                'Nacido el 21 de enero de 2000. \n'
                    'Es hombre \n'
                    'Su correo: prueba1@gmail.com \n'),
            leading: Icon(Icons.person),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            ],
          )
        ],
      ),
    );
  }

  Card miCardRecetas() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text('Recetas '),
            subtitle: Text(
                'Medicamento 1: . \n'
                    'Medicamento 2: \n'
                    'Medicamento 3 :\n'),
            leading: Icon(Icons.person),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            ],
          )
        ],
      ),
    );
  }
}