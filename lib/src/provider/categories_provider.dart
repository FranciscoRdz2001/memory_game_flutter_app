import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/constants.dart';

import '../data/models/category_model.dart';


class CategoriesProvider with ChangeNotifier{

  List<CategoryModel> categories = [
    CategoryModel(path: animalsImagesPath, title: "Animales", description: "Aprende mas de los animales con las siguientes imagenes.", icon: "lionIcon"),
    CategoryModel(path: statesImagesPath, title: "Estados", description: "Un poco de información sobre los estados.", icon: "iceIcon"),
  ];

  CategoriesProvider(final BuildContext context){
    loadImages(context);
  }

  void loadImages(final BuildContext context) async{
    final manifestContent = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    for(CategoryModel cat in categories){
      final images = manifestMap.keys
          .where((String key) => key.contains('${cat.path}/'))
          .where((String key) => key.contains('.png') || key.contains('.jpg'))
          .toList();
      cat.images = images;
    }
    notifyListeners();
  }

  void setColor(final CategoryModel cat, final Color color){

    int catIndex = categories.indexOf(cat);

    categories[catIndex].bgColor = color;
    notifyListeners();
  }
}