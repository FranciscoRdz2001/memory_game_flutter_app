

import 'package:flutter/material.dart';

class CategoryInfo{

  final List<Category> list = [
    Category(path: "animals", title: "Animales", description: "Aprende mas de los animales con las siguientes imagenes.", icon: "lionIcon", color: Colors.red, imageType: ImagesType.animals),
    Category(path: "states", title: "Estados", description: "Un poco de información sobre los estados.", icon: "iceIcon", color: Colors.blue, imageType: ImagesType.states),
  ];
}

enum ImagesType {
  animals,
  states
}

class Category{

  String path;
  String title;
  String description;
  String icon;
  MaterialColor color;
  ImagesType imageType;

  Category({required this.path, required this.title, required this.description, required this.icon, required this.color, required this.imageType});

}