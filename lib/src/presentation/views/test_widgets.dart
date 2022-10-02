import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/responsive.dart';
import 'package:memoram_app/src/presentation/widgets/header_painter.dart';


class TestWidgets extends StatelessWidget {
  const TestWidgets({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ResponsiveUtil resp = ResponsiveUtil.of(context);

    return Scaffold(
      body: CustomPaint(
        size: Size(resp.width, resp.height / 2),
        painter: const HeaderPainter(),
      ),
    );
  }
}