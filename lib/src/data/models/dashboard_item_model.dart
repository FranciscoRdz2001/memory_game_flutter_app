import 'package:flutter/cupertino.dart';

class DashboardItemModel{

  final Color bgColor;
  final IconData icon;
  final String title;
  final String value;

  const DashboardItemModel({
    required this.bgColor,
    required this.icon,
    required this.title,
    required this.value,
  });

}