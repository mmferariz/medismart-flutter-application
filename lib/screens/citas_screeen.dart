import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:remind_pills/bloc/bloc.dart';
import 'package:remind_pills/cita_paciente.dart';
import 'package:remind_pills/model/user.dart';
import 'package:remind_pills/screens/expediente_paciente_screen.dart';
import 'package:remind_pills/utils/datetime_converter.dart';

class CitaPaciente extends StatefulWidget {
  const CitaPaciente({Key? key}) : super(key: key);

  @override
  _CitaPaciente createState() => _CitaPaciente();
}

class _CitaPaciente extends State<CitaPaciente> {

  late SingletonBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<SingletonBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cita'),
        backgroundColor: CupertinoColors.activeBlue.highContrastColor,
      ),
      body: StreamBuilder<User>(
          stream: _bloc.streamUser,
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return const Card(child: Center(child: Text("Ocurrió un error inesperado")));
            }
            if(snapshot.hasData){
              return ListView(
                children: [
                 // CitaInfo(user: user),
                ],
              );
            }
            return const Card(
              child: Center(child: CircularProgressIndicator()),
            );
          }
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
}

class CitaInfo extends StatelessWidget {

  final User user;

  const CitaInfo({
    Key? key, required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text('Informacion Cita'),
            subtitle: Text(
                """Nacido el ${ user.fechaNacimiento != null ? DateTimeConverter.longDateConversion(user.fechaNacimiento!) : "-"}.
Sexo: ${user.gender}
Su correo: ${user.email}"""),
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

class ProfileImage extends StatelessWidget {

  final String name;

  const ProfileImage({
    Key? key, required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: [
          const Image(
            image: NetworkImage(
                'https://picsum.photos/400'),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(name),
          ),
        ],
      ),
    );
  }
}