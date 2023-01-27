import 'package:flutter/material.dart';

Future<void> showResponseDialog(BuildContext context, String details, ResponseType type){

  const Map icons = {
    ResponseType.Success: Icon(
      Icons.check_circle,
      color: Colors.green,
      size: 50,
    ),
    ResponseType.Failed: Icon(
      Icons.cancel,
      color: Colors.red,
      size: 50,
    )        
  };

  return showDialog<void>(
      context: context,
      useSafeArea: true,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          // title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15),
                alignment: Alignment.center,
                width: 50,
                height: 50,
                child: icons[type],
              ),
              Flexible(
                child: Text(details)
              )
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: Text("Cerrar")
            )
          ],
        );
      }
  );

}

enum ResponseType{
  Success,
  Failed
}
