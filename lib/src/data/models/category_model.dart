import 'package:flutter/material.dart';

class CategoryModel{

  Color? bgColor;
  List<String>? images;

  final String path;
  final String title;
  final String description;
  final String icon;

  CategoryModel({
    this.bgColor,
    this.images,
    required this.path,
    required this.title,
    required this.description, 
    required this.icon, 
  });
}