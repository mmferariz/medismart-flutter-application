import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:remind_pills/bloc/bloc.dart';
import 'package:remind_pills/model/cita.dart';
import 'package:remind_pills/model/user.dart';
import 'package:remind_pills/utils/datetime_converter.dart';
import 'package:remind_pills/widgets/customs_drawer.dart';

class CitasScreen extends StatefulWidget {
  const CitasScreen({Key? key}) : super(key: key);

  @override
  _CitasScreen createState() => _CitasScreen();
}

class _CitasScreen extends State<CitasScreen> {

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
              if(snapshot.data!.citas == null){
                return const Card(child: Center(child: Text("No tienes citas registradas")));
              }
              if(snapshot.data!.citas!.isNotEmpty){
                final citas = snapshot.data?.citas;
                return RefreshIndicator(
                  onRefresh: () async => getData(),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(parent:  AlwaysScrollableScrollPhysics()),
                    itemCount: citas!.length,
                    itemBuilder: (context, index) => CitaInfo(cita: citas[index]),
                  ),
                );
              } else {
                return const Card(child: Center(child: Text("No tienes citas registradas")));
              }
            }
            return const Card(
              child: Card(child: Center(child: CircularProgressIndicator())),
            );
          }
      ),
      drawer: CustomDrawer(),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getData();
    });
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

class CitaInfo extends StatelessWidget {

  final Cita cita;

  const CitaInfo({
    Key? key, required this.cita,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 15),
      elevation: 10,
      child: ListTile(
        contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 0),
        title: Text(cita.motivo ?? "Sin motivo"),
        subtitle: Text("Fecha asignada: ${cita.fechaAsignada != null ? DateTimeConverter.mediumDateConversion(cita.fechaAsignada!) : "Sin asignar"}\nMedico asignado: ${cita.medico ?? "Sin asignar"}"),
        isThreeLine: true,
        leading: Icon(Icons.note_add),
      ),
    );
  }
}