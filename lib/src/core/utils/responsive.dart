import 'dart:math';

import 'package:flutter/cupertino.dart';

class ResponsiveUtil{

  factory ResponsiveUtil.of(BuildContext context) => ResponsiveUtil(context: context);

  ResponsiveUtil({
    required BuildContext context
  }){
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    diagonal = sqrt(pow(size.width, 2) + pow(size.height, 2));
    lPadding = width * 0.05;
    rPadding = width * 0.05;
    bPadding = height * 0.025;
    tPadding = height * 0.05;
    separatorHeight = height * 0.035;
    separatorWidth = width * 0.05;
  }

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

  double hp(double percent) => height * percent / 100;
  double wp(double percent) => width * percent / 100;
  double dp(double percent) => diagonal * percent / 100;
}