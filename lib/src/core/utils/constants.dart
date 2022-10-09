import 'package:flutter/material.dart';
import 'package:memoram_app/src/data/models/dashboard_item_model.dart';

const Color accent = Color(0xff6aaff9);
const Color black = Color(0xff282a40);
const Color containerBG = Color(0xfffefeff);

List<BoxShadow> shadows = [
    BoxShadow(
      blurRadius: 50,
      color: Colors.grey[100]!,
      offset: const Offset(0, 15)
    )
];

// PATHS

const String _imagesFolders = 'assets/images';
const String _categoriesPath = '$_imagesFolders/categories';


const String illustrationsPath = '$_imagesFolders/illustrations'; 
const String iconsImagesPath = '$_imagesFolders/icons';
const String questionAndCorrectImagesPath =  '$_imagesFolders/questionAndCorrect';

const String animalsImagesPath = '$_categoriesPath/animals';
const String statesImagesPath = '$_categoriesPath/states';

const String questionImagePath = '$questionAndCorrectImagesPath/question.png';

List<DashboardItemModel> dashboardItems = const [
    DashboardItemModel(
      title: 'Games', value: '10', bgColor: Color.fromARGB(255, 94, 99, 255), icon: Icons.videogame_asset_rounded
    ),
    DashboardItemModel(
      title: 'Wins', value: '2', bgColor: Color.fromARGB(255, 98, 231, 86), icon: Icons.diamond_rounded
    ),
    DashboardItemModel(
      title: 'Losses', value: '8', bgColor: Color.fromARGB(255, 233, 86, 86), icon: Icons.dangerous_rounded
    ),
  ];