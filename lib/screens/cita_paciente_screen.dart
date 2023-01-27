import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:remind_pills/bloc/bloc.dart';
import 'package:remind_pills/utils/custom_error_handler.dart';
import 'package:remind_pills/utils/exit_will_pop.dart';
import 'package:remind_pills/utils/regex.dart';
import 'package:remind_pills/widgets/custom_response_dialog.dart';
import 'package:remind_pills/widgets/custom_text_field.dart';
import 'package:remind_pills/widgets/customs_drawer.dart';
import 'package:remind_pills/widgets/generic_date_picker.dart';
import 'package:remind_pills/widgets/load_dialog.dart';

class CitaPaciente extends StatefulWidget {
  const CitaPaciente({Key? key}) : super(key: key);

  @override
  _CitaPaciente createState() => _CitaPaciente();
}

class _CitaPaciente extends State<CitaPaciente> {

  GlobalKey<FormState> _key = GlobalKey();

  TextEditingController _txtReason = TextEditingController();
  TextEditingController _txtDescription = TextEditingController();

  late SingletonBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<SingletonBloc>(context);
    return WillPopScope(
      onWillPop: () async => await exitWillPop(context),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Registrar Cita'),
            backgroundColor: CupertinoColors.activeBlue.highContrastColor,
          ),
          body: SingleChildScrollView(
              child: Container(
            margin: EdgeInsets.all(25.0),
            child: formUI(),
          )),
          drawer: CustomDrawer()),
    );
  }

  formItemsDesign(icon, item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Card(child: ListTile(leading: Icon(icon), title: item)),
    );
  }

  Widget formUI() {
    return Form(
      key: _key,
      child: Column(
        children: <Widget>[
          CustomTextField(
            labelText: "Motivo de la consulta",
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            controller: _txtReason,
            regex: Regex.notEmpty,
            errorMessage: "El motivo no puede estar vació",
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          CustomTextField(
            labelText: "Descripción",
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none,
            controller: _txtDescription,
          ),
          // GenericDatePicker(
          //   DateTime.now(),
          //   DateTime.now().add(const Duration(days: 90)), 
          //   selectedTime: endDay,
          //   onChange: (time) {
          //     setState(() {
          //       endDay = time;
          //     });
          //     _inventoryDayBloc.sinkInventoryDays.add(null);
          //     getInventoryDays();
          //   },
          // ),
          GestureDetector(
              onTap: () => validateForm(context),
              child: Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  gradient: const LinearGradient(colors: [
                    Color(0x006fa8dc),
                    Color(0xFF03A0FE),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: const Text("Guardar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 50,
              )),
          GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, "/expediente"),
              child: Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  gradient: LinearGradient(colors: [
                    Colors.deepOrangeAccent,
                    Colors.red,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
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
      ),
    );
  }

  validateForm(BuildContext context) async {
    if(_key.currentState!.validate()){
      showLoadDialog(context);
      try {
        Navigator.of(context).pop();
        await _bloc.registerAppointment(_txtReason.text, _txtDescription.text.isEmpty ? null : _txtDescription.text);
        await showResponseDialog(context, "Cita registrada exitosamente", ResponseType.Success);
        Navigator.pushReplacementNamed(context, "/expediente");
      } on CustomError catch (e) {
        showResponseDialog(context, e.message ?? "Ocurrió un error desconocido", ResponseType.Failed);
      } catch (e) {
        showResponseDialog(context, "Ocurrió un error desconocido", ResponseType.Failed);
      }
    }
  }
}
