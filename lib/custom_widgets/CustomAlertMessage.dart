import 'package:flutter/material.dart';

class CustomAlertMessage {
  static Future<void> showMyDialog(BuildContext context, List<Widget> body, String title) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25, color: Colors.blue[200], fontFamily: "Simply"), textAlign: TextAlign.center),
          content: SingleChildScrollView(
            child: ListBody(
              children: body
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Aceptar'),
              onPressed: () => Navigator.of(context).pop()
            ),
          ],
        );
      },
    );
  }
}