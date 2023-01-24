import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class CitaPaciente extends StatefulWidget {
  
  const CitaPaciente({Key? key}) : super(key: key);

  @override
  _CitaPaciente createState() => _CitaPaciente();
}

class _CitaPaciente extends State<CitaPaciente> {
  GlobalKey<FormState> keyForm =  GlobalKey();
  TextEditingController  nameCtrl =  TextEditingController();
  TextEditingController  apPaCtrl =  TextEditingController();
  TextEditingController  apMaCtrl =  TextEditingController();
  TextEditingController dateCtrl = TextEditingController() ;
  TextEditingController  emailCtrl =  TextEditingController();
  TextEditingController  mobileCtrl =  TextEditingController();
  TextEditingController  passwordCtrl =  TextEditingController();
  TextEditingController  repeatPassCtrl =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Registrar Cita'),
          backgroundColor: CupertinoColors.activeBlue.highContrastColor,
        ),
        body: SingleChildScrollView(
          child:  Container(
            margin:  EdgeInsets.all(25.0),
            child:  Form(
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
                  Navigator.pushReplacementNamed(context, "/expediente");
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
                      builder: (BuildContext context) => CitaPaciente(),
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
              decoration:  InputDecoration(
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
              decoration:  InputDecoration(
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
                decoration:  InputDecoration(
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
          margin:  EdgeInsets.all(20),
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

          margin:  EdgeInsets.all(20),
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
