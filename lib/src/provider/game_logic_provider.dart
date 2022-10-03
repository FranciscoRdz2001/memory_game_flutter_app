import 'package:flutter/material.dart';
import 'package:memoram_app/src/data/models/category_model.dart';

class GameLogicProvider with ChangeNotifier{

  CategoryModel? _selectedCategory;
  List<String>? _selectedImages;

  int? _movements;


  final int _imagesToRepeat = 2;

  CategoryModel get selectedCategory => _selectedCategory!;
  set selectedCategory(final CategoryModel cat){
    _selectedCategory = cat;
    notifyListeners();
  }

  GameLogicProvider(){

  }

}