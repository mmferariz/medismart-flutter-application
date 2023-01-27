import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:remind_pills/bloc/bloc.dart';

class CustomDrawer extends StatelessWidget {

  CustomDrawer({Key? key}) : super(key: key);

  late SingletonBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of(context);
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://picsum.photos/400'),
              ),
              accountEmail: Text('jane.doe@example.com'),
              accountName: Text(
                'Jane Doe',
                style: TextStyle(fontSize: 24.0),
              ),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.medical_information_rounded),
              title: const Text(
                'Expediente',
                style: TextStyle(fontSize: 24.0),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "/expediente"
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
                Navigator.pushReplacementNamed(
                  context,
                  "/registrarCita"
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.medical_information_sharp),
              title: const Text(
                'Mis citas',
                style: TextStyle(fontSize: 24.0),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "/citas"
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'Cerrar sesion',
                style: TextStyle(fontSize: 24.0),
              ),
              onTap: () {
                _bloc.clearLocalData();
                Navigator.pushReplacementNamed(context, "/login");
              },
            ),
          ],
        ),
      ),
    );
  }
}
