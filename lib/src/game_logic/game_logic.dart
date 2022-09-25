import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/responsive.dart';

import '../Information/images_information.dart';
import '../styles/styles.dart';
import '../presentation/widgets/custom_alert.dart';
import '../data/models/animal_model.dart';
import 'game_states.dart';
import 'images_categories.dart';

class GameLogic with ChangeNotifier{
  
  final Random random = Random();
  final int numOfRepeatImages = 2;
  
  late List<String> _imagesDirection;
  late List<ImageModel> _selectedImages;

  BuildContext context;
  GameStates? gameState;
  CheckStates? checkState;
  ImagesType? imagesType;

  ComparisonStatus? comparisonStatus;
  List<ImageModel>? images;
  int imagesToShow = 2;
  late int movements;
  int? correctImages;

  get imagesQuantity => _imagesDirection.length;

  GameLogic({required this.context}){
    _setDefaultData();
  }

  Future<void> start() async{
    await restart();
    gameState = GameStates.started;
    notifyListeners();
  }
  Future<void> restart() async{ // Reinicia el juego por completo, borrando todos los datos
    _setDefaultData();
    _generateRandomImages();
  }

  void _setDefaultData(){ // Se eliminan todos los datos que tenga el juego
    movements = 0;
    correctImages = 0;
    images = [];
    _selectedImages = [];
    gameState = GameStates.notStarted;
    checkState = CheckStates.none;
    comparisonStatus = ComparisonStatus.none;
    notifyListeners();
  }

  Future<void> getImagesFromFolder(String folder) async{
    _imagesDirection = [];
    final manifestContent = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    _imagesDirection = manifestMap.keys
        .where((String key) => key.contains('images/$folder'))
        .where((String key) => key.contains('.png'))
        .toList();
    _generateRandomImages();
  }

  void _generateRandomImages(){
    List<int> availableIndex = [];
    late Map<String, String> categoriesInformation;
    switch (imagesType) {
      case ImagesType.animals:
        categoriesInformation = Information().animals;
        break;
      case ImagesType.states:
        categoriesInformation = Information().states;
        break;
      default:
    }
    images!.length = imagesToShow;

    if(_imagesDirection.isNotEmpty){
      for(int x = 0; x < imagesToShow; x++) {
        availableIndex.add(x);
      }
      for(int x = 0; x < imagesToShow / 2; x++){
        for(int i = 0; i < numOfRepeatImages; i++){
          int rndIndex = availableIndex.length == 1 ? 0 : random.nextInt(availableIndex.length - 1);
          for(int j = 0; j < categoriesInformation.length; j++) {
            if(_imagesDirection[x].contains(categoriesInformation.keys.elementAt(j))) {
              images![availableIndex[rndIndex]] = ImageModel(name: _imagesDirection[x], information: categoriesInformation.values.elementAt(j));
            }
          }
          availableIndex.remove(availableIndex[rndIndex]);
        }
      }
    }
    notifyListeners();
  }

  void addImageToList(int index) async{
    _selectedImages.add(images![index]);
    images![index].isSelected = true;
    images![index].completeAnimation();
    _selectedImages[_selectedImages.length - 1].currentImage = _selectedImages[_selectedImages.length - 1].name;
    if(_selectedImages.length >= numOfRepeatImages) await compareAndCheckImages();
    await Future.delayed(const Duration(milliseconds: 150), () async => notifyListeners());
  }

  Future<void> compareAndCheckImages() async{

    final ResponsiveUtil resp = ResponsiveUtil.of(context);

    comparisonStatus = ComparisonStatus.none;
    movements += 1;
    checkState = CheckStates.comparing;
      if(compareImages()){
        comparisonStatus = ComparisonStatus.correct;
        correctImages = correctImages! + _selectedImages.length;
        if(correctImages! >= images!.length){
          gameState = GameStates.won;
          CustomAlertMessage.showMyDialog(
            context, 
            [
              Text("Si quieres volver a jugar, reinicia el juego.", style: TextStyles.w400(resp.wp(1)).copyWith(fontSize: 15), textAlign: TextAlign.center, overflow: TextOverflow.visible)], "¡Has ganado el juego!");
        } 
        notifyListeners();
        await CustomAlertMessage.showMyDialog(context, [Image.asset(_selectedImages[0].name), Text(_selectedImages[0].information, style: TextStyles.w400(resp.wp(1)).copyWith(fontSize: 15), textAlign: TextAlign.center, overflow: TextOverflow.visible)],"Información sobre esta imagen..."); 
        await Future.delayed(const Duration(milliseconds: 850), () async => notifyListeners());
      }
      else{
        comparisonStatus = ComparisonStatus.incorrect;
        notifyListeners();
        await setDefaultRotationToImage();
      } 
      _selectedImages = [];
    Future.delayed(const Duration(milliseconds: 50), () async {
      comparisonStatus = ComparisonStatus.none;
      checkState = CheckStates.none;
      notifyListeners();
    });
  }

  Future<void> setDefaultRotationToImage() async{
    int delayPerImage = _selectedImages.isEmpty ? 850 : 850 ~/ _selectedImages.length;
    for(int x = 0; x < _selectedImages.length; x++){
      await Future.delayed(Duration(milliseconds: delayPerImage), (){
        _selectedImages[x].restoreAnimation();
        _selectedImages[x].isSelected = false;
        _selectedImages[x].currentImage = _selectedImages[x].questionImage;
        notifyListeners();
      });
    }
  }

  bool compareImages(){ // Compara si las imagenes son las mismas
    for(int x = 0; x < _selectedImages.length - 1; x++) {
      if(_selectedImages[x].name == _selectedImages[x + 1].name) return true;
    }
    return false;
  }

  void changeGameSize(int value){
    imagesToShow = value * 2;
    notifyListeners();
  }
} 