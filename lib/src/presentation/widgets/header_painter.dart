import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/constants.dart';


class HeaderPainter extends CustomPainter {

  const HeaderPainter();

  @override
  void paint(Canvas canvas, Size size) {

    Path path = Path();
    Paint paint = Paint();

    final usableHeight = size.height / 3;


    path.lineTo(0, usableHeight * 0.75);
    path.quadraticBezierTo(size.width * 0.10, usableHeight * 0.70,   size.width * 0.17, usableHeight * 0.90);
    path.quadraticBezierTo(size.width * 0.20, usableHeight, size.width * 0.25, usableHeight * 0.90);
    path.quadraticBezierTo(size.width * 0.40, usableHeight * 0.40, size.width * 0.50, usableHeight * 0.70);
    path.quadraticBezierTo(size.width * 0.60, usableHeight * 0.85, size.width * 0.65, usableHeight * 0.65);
    path.quadraticBezierTo(size.width * 0.70, usableHeight * 0.90, size.width, 0);
    path.close();

    paint.color = accent.withOpacity(0.25);
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, usableHeight * 0.50);
    path.quadraticBezierTo(size.width * 0.10, usableHeight * 0.80, size.width * 0.15, usableHeight * 0.60);
    path.quadraticBezierTo(size.width * 0.20, usableHeight * 0.45, size.width * 0.27, usableHeight * 0.60);
    path.quadraticBezierTo(size.width * 0.45, usableHeight,  size.width * 0.50, usableHeight * 0.80);
    path.quadraticBezierTo(size.width * 0.55, usableHeight * 0.45, size.width * 0.75, usableHeight * 0.75);
    path.quadraticBezierTo(size.width * 0.85, usableHeight * 0.93, size.width, usableHeight * 0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = accent.withOpacity(0.5);
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, usableHeight * 0.75);
    path.quadraticBezierTo(size.width * 0.10, usableHeight * 0.55, size.width * 0.22, usableHeight * 0.70);
    path.quadraticBezierTo(size.width * 0.30, usableHeight * 0.90, size.width * 0.40, usableHeight * 0.75);
    path.quadraticBezierTo(size.width * 0.52, usableHeight * 0.50, size.width * 0.65, usableHeight * 0.70);
    path.quadraticBezierTo(size.width * 0.75, usableHeight * 0.85, size.width, usableHeight * 0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = accent;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}