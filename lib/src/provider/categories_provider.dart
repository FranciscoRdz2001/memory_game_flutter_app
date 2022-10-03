import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/constants.dart';

import '../data/models/category_model.dart';
import '../game_logic/images_types.dart';


class CategoriesProvider with ChangeNotifier{

  List<CategoryModel> list = [
    CategoryModel(path: animalsImagesPath, title: "Animales", description: "Aprende mas de los animales con las siguientes imagenes.", icon: "lionIcon", imageType: ImagesType.animals),
    CategoryModel(path: statesImagesPath, title: "Estados", description: "Un poco de información sobre los estados.", icon: "iceIcon", imageType: ImagesType.states),
  ];

  void setColor(final CategoryModel cat, final Color color){

    int catIndex = list.indexOf(cat);

    list[catIndex].bgColor = color;
    notifyListeners();
  }
}