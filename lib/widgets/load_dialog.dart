import 'package:flutter/material.dart';

Future<void> showLoadDialog(BuildContext context){

  return showDialog<void>(
      context: context,
      useSafeArea: true,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Cargando'),
          content: Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          ),
        );
      }
  );

}
