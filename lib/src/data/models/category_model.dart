import 'package:flutter/material.dart';
import 'package:memoram_app/src/game_logic/images_types.dart';

class CategoryModel{

  Color? bgColor;

  final String path;
  final String title;
  final String description;
  final String icon;
  final ImagesType imageType;

  CategoryModel({
    this.bgColor, 
    required this.path, 
    required this.title, 
    required this.description, 
    required this.icon, 
    required this.imageType
  });

}