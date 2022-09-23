


import 'package:flutter/cupertino.dart';

class ResponsiveUtil{

  final double width;
  final double height;
  final double lPadding;
  final double rPadding;

  // final bool isPhone;
  // final bool isTablet;
  // final bool isWeb;

  const ResponsiveUtil({
    required this.width,
    required this.height,
    required this.lPadding,
    required this.rPadding
  });

  factory ResponsiveUtil.of(BuildContext context){

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final lPadding = width * 0.01;
    final rPadding = width * 0.01;

    return ResponsiveUtil(
      width: width,
      height: height,
      lPadding: lPadding,
      rPadding: rPadding
    );
  }
}