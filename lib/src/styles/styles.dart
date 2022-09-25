
import 'package:flutter/material.dart';


class TextStyles{

  static TextStyle _fontBase(final double size, final Color color){
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: size,
      color: color
    );
  }

  static TextStyle w700(final double size, [Color color = Colors.black])
    => _fontBase(size, color = color).copyWith(fontWeight: FontWeight.w700);

  static TextStyle w600(final double size, [Color color = Colors.black])
    => _fontBase(size, color = color).copyWith(fontWeight: FontWeight.w600);

  static TextStyle w500(final double size, [Color color = Colors.black])
    => _fontBase(size, color = color).copyWith(fontWeight: FontWeight.w500);

  static TextStyle w400(final double size, [Color color = Colors.black])
    => _fontBase(size, color = color).copyWith(fontWeight: FontWeight.w400);

  static TextStyle w300(final double size, [Color color = Colors.black])
    => _fontBase(size, color = color).copyWith(fontWeight: FontWeight.w300);

  static TextStyle w200(final double size, [Color color = Colors.black])
    => _fontBase(size, color = color).copyWith(fontWeight: FontWeight.w200);

  static TextStyle w100(final double size, [Color color = Colors.black])
    => _fontBase(size, color = color).copyWith(fontWeight: FontWeight.w100);

  static final TextStyle subTitle = new TextStyle(
    fontWeight: FontWeight.w300, 
    fontSize: 15, 
    color: Colors.white, 
    fontFamily: "Montserrat"
  );
  static final TextStyle body = new TextStyle(
    fontWeight: FontWeight.w200, 
    fontSize: 25, 
    color: Colors.black87, 
    fontFamily: "Montserrat"
  );
  static final TextStyle bodyMessages = new TextStyle(
    fontSize: 15, 
    color: Colors.black38, 
    fontFamily: "Montserrat"
  );
  static final TextStyle containerName = new TextStyle(
    fontSize: 20, 
    color: Colors.black87, 
    fontFamily: "Montserrat"
  );
  static final TextStyle containerBody = new TextStyle(
    fontSize: 14, 
    color: Colors.black54, 
    fontFamily: "Montserrat"
  );
}