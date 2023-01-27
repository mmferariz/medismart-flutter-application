import 'package:flutter/material.dart';

Future<bool> exitWillPop(BuildContext context) async {
  if(Navigator.canPop(context)){
    return Future.value(true);
  } else {
    bool result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text("¿Desea salir de la aplicación?"),
          actions: [
            ElevatedButton(
              child: const Text("Si"),
              style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            ElevatedButton(
              child: const Text("No"),
              style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        );
      },
    );
    return Future.value(result);
  }
}