import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:remind_pills/bloc/bloc.dart';
import 'package:remind_pills/model/receta.dart';
import 'package:remind_pills/screens/cita_paciente_screen.dart';
import 'package:remind_pills/model/user.dart';
import 'package:remind_pills/utils/datetime_converter.dart';
import 'package:remind_pills/utils/exit_will_pop.dart';
import 'package:remind_pills/widgets/custom_response_dialog.dart';
import 'package:remind_pills/widgets/customs_drawer.dart';

class ExpedientePaciente extends StatefulWidget {
  const ExpedientePaciente({Key? key}) : super(key: key);

  @override
  _ExpedienteCliente createState() => _ExpedienteCliente();
}

class _ExpedienteCliente extends State<ExpedientePaciente> {
  
  late SingletonBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<SingletonBloc>(context);
    return WillPopScope(
      onWillPop: () async => await exitWillPop(context),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Expediente'),
             backgroundColor: CupertinoColors.activeBlue.highContrastColor,
          ),
          body: StreamBuilder<User>(
            stream: _bloc.streamUser,
            builder: (context, snapshot) {
              if(snapshot.hasError){
                return const Card(child: Center(child: Text("Ocurrió un error inesperado")));
              } 
              if(snapshot.hasData){
                final recetas = snapshot.data!.recetas;
                return Column(
                  children: [
                    ProfileImage(name: "${snapshot.data?.nombre} ${snapshot.data?.apellidos}"),
                    UserDetail(user: snapshot.data!),
                    recetas != null && recetas.isNotEmpty ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: recetas.length,
                      itemBuilder: (context, index) => RecetaTile(receta: recetas[index],),
                    ) : const Card(child: Center(child: Text("Ocurrió un error inesperado"))),
                  ],
                );
              }
              return const Card(
                child: Center(child: CircularProgressIndicator()),
              );
            }
          ),
          drawer: CustomDrawer()
        ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {getData();});
    super.initState();
  }

  void getData() {
    _bloc.getInfoUser().then(
        (value) => _bloc.sinkUser.add(value)
      ).catchError(
        (error) => _bloc.sinkUser.addError(error)
      );
  }

}

class RecetaTile extends StatelessWidget {

  final Receta receta;

  const RecetaTile({
    Key? key, required this.receta,
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
            title: Text(DateTimeConverter.mediumDateConversion(receta.createdAt!)),
            subtitle: receta.medicamentos != null && receta.medicamentos!.isNotEmpty ? Column(
              children: List.generate(receta.medicamentos!.length, (index) => Text(receta.medicamentos![index].cantidad!)),
            ) : const Text("Sin medicamentos asignados"),
            leading: Icon(Icons.medical_services_sharp),
            trailing: ElevatedButton(
              child: Icon(Icons.timer),
              onPressed: () => showResponseDialog(context, "Recordatorio programado para ${receta.medicamentos?.first.cantidad}", ResponseType.Success),
            ),
          ),
        ],
      ),
    );
  }
}

class UserDetail extends StatelessWidget {

  final User user;

  const UserDetail({
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
            title: Text('Informacion Personal'),
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