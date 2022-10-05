import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memoram_app/src/data/models/category_model.dart';
import 'package:memoram_app/src/domain/game_status.dart';

class GameLogicProvider with ChangeNotifier{

  GameStatus? status;

  CategoryModel? _category;
  List<String>? _selectedImages;
  List<String>? _mixedImages;
  int? _movements;
  int? _imagesQuantity;


  final int _imagesToRepeat = 2;

  List<String>? get mixedImages => _mixedImages!;
  int get imagesQuantity => _imagesQuantity!;
  int get movements => _movements!;


  set imagesQuantity(final int quantity){
    _imagesQuantity = quantity;
    _mixImages();
    notifyListeners();
  }

  GameLogicProvider(){
    _initialize();
  }


  void startGame(){

  }

  void endGame(){

  }

  void _initialize(){
    status = GameStatus.notStarted;
    _mixedImages = [];
    _movements = 0;
    _imagesQuantity = 2;
  }

  void _mixImages(){

    final elementsToTake = _imagesQuantity! ~/ 2;
    final tempImages = [...List.from(_category!.images!.take(elementsToTake)), ...List.from(_category!.images!.take(elementsToTake))];

    _mixedImages = [];

    int lenght = tempImages.length - 1;
    while(lenght >= 0){
      final int randomIndex = tempImages.length == 1 ? 0 : Random().nextInt(tempImages.length - 1);
      final String image = tempImages[randomIndex];

      _mixedImages!.add(image);
      tempImages.remove(tempImages[randomIndex]);
      lenght--;
    }
    print(_mixedImages!.length);
  }

  CategoryModel get category => _category!;
  set category(final CategoryModel cat){
    _category = cat;
    _initialize();
    notifyListeners();
  }
}