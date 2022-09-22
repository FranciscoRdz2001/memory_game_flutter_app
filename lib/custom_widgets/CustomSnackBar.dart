

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSnackBar{

  CustomSnackBar({@required BuildContext context, @required MaterialColor color, @required String message}){
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      duration: Duration(milliseconds: 500),
      content: Text('$message.', style: TextStyle(fontWeight: FontWeight.w600), textAlign: TextAlign.center),
      ),
    );
  }

}