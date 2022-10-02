import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class BubblesPainter extends CustomPainter{

  final Color bubblesColor;

  const BubblesPainter({
    required this.bubblesColor
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = bubblesColor
      ..strokeWidth = 10;

    final height = size.height;

    final path = Path();
    path.lineTo(0, height * 0.50);
    path.quadraticBezierTo(size.width * 0.10, height * 0.80, size.width * 0.15, height * 0.60);
    path.quadraticBezierTo(size.width * 0.20, height * 0.45, size.width * 0.27, height * 0.60);
    path.quadraticBezierTo(size.width * 0.45, height,  size.width * 0.50, height * 0.80);
    path.quadraticBezierTo(size.width * 0.55, height * 0.45, size.width * 0.75, height * 0.75);
    path.quadraticBezierTo(size.width * 0.85, height * 0.93, size.width, height * 0.60);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);

    // final diagonal = sqrt(pow(size.width, 2) + pow(size.height, 2));

    // const int bubblesQuantity = 5;

    // final List<Map<String, dynamic>> circlesData = [];
    // for(int x = 0; x < bubblesQuantity; x++){
    //   final double heightPercent = Random().nextInt(100) / 100;
    //   final double widthPercent = Random().nextInt(100) / 100;
    //   final double sizePercent = Random().nextInt(30) / 100;

    //   final double opacityPercent = clampDouble(Random().nextDouble(), 0.01, 0.1);

    //   circlesData.add({
    //     'position' : Offset(size.width * widthPercent, size.height * heightPercent),
    //     'radius'   : diagonal * sizePercent,
    //     'color'    : bubblesColor.withOpacity(opacityPercent)
    //   });
    // }
    // for(final c in circlesData){
    //   paint.color = c['color'];
    //   canvas.drawCircle(c['position'], c['radius'], paint);
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}