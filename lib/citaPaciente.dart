import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:remind_pills/LoginScreen.dart';
import 'package:remind_pills/expedientePaciente.dart';
class citaPaciente extends StatefulWidget {
  @override
  _CitaPaciente createState() => _CitaPaciente();
}

class _CitaPaciente extends State<citaPaciente> {
  GlobalKey<FormState> keyForm = new GlobalKey();
  TextEditingController  nameCtrl = new TextEditingController();
  TextEditingController  apPaCtrl = new TextEditingController();
  TextEditingController  apMaCtrl = new TextEditingController();
  TextEditingController dateCtrl =new TextEditingController() ;
  TextEditingController  emailCtrl = new TextEditingController();
  TextEditingController  mobileCtrl = new TextEditingController();
  TextEditingController  passwordCtrl = new TextEditingController();
  TextEditingController  repeatPassCtrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Registrar Cita'),
          backgroundColor: CupertinoColors.activeBlue.highContrastColor,
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(25.0),
            child: new Form(
              key: keyForm,
              child: formUI(),
            ),
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
                      builder: (BuildContext context) =>  expedientePaciente(),
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
                      builder: (BuildContext context) =>  citaPaciente(),
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
  formItemsDesign(icon, item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Card(child: ListTile(leading: Icon(icon), title: item)),
    );
  }

  Widget formUI() {
    return  Column(
      children: <Widget>[
        //TODO:TABLA DE SELECCION DOCTOR
       /* PaginatedDataTable(
          header: Text('Header Text'),
          rowsPerPage: 4,
          columns: [
            DataColumn(label: Text('Header A')),
            DataColumn(label: Text('Header B')),
            DataColumn(label: Text('Header C')),
            DataColumn(label: Text('Header D')),
          ],
         _DataSource(context),
        ),*/
        formItemsDesign(
            Icons.info,
            TextFormField(
              controller: nameCtrl,
              decoration: new InputDecoration(
                labelText: 'Motivo*',
              ),
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ) ),
        formItemsDesign(
            Icons.medical_information,
            TextFormField(
              controller: apPaCtrl,
              decoration: new InputDecoration(
                labelText: 'Descripcion*',
              ),
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            )),
        formItemsDesign(
            Icons.calendar_today,
            TextFormField(
                controller: dateCtrl,
                decoration: new InputDecoration(
                  labelText: 'Fecha de cita*',
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate:DateTime(2000),
                      lastDate: DateTime(2101)
                  );
                  if(pickedDate != null ){
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                    setState(() {
                      dateCtrl.text = formattedDate;
                    });
                  }else{
                    print("Date is not selected");
                  }
                }
            )),

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
          child: Text("Guardar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 50,
        )),
        GestureDetector(
            onTap: (){
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
