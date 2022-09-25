import 'dart:math';

import 'package:flutter/cupertino.dart';

class ResponsiveUtil{

  late final double width;
  late final double height;
  late final double diagonal;
  
  late final double lPadding;
  late final double rPadding;
  late final double tPadding;
  late final double bPadding;
  
  late final double separatorHeight;
  late final double separatorWidth;

  // final bool isPhone;
  // final bool isTablet;
  // final bool isWeb;

  ResponsiveUtil({
    required BuildContext context
  }){
    final size = MediaQuery.of(context).size;
    this.width = size.width;
    this.height = size.height;
    this.diagonal = sqrt(pow(size.width, 2) + pow(size.height, 2));
    this.lPadding = width * 0.05;
    this.rPadding = width * 0.05;
    this.bPadding = height * 0.025;
    this.tPadding = height * 0.05;
    this.separatorHeight = height * 0.035;
    this.separatorWidth = width * 0.05;
  }

  factory ResponsiveUtil.of(BuildContext context) => ResponsiveUtil(context: context);

  double hp(double percent) => height * percent / 100;
  double wp(double percent) => width * percent / 100;
  double dp(double percent) => diagonal * percent / 100;
}