
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
}