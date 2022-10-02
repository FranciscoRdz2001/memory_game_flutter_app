import 'package:flutter/material.dart';

const Color accent = Color(0xff6aaff9);

List<BoxShadow> shadows = [
    BoxShadow(
      blurRadius: 50,
      color: Colors.grey[50]!,
      offset: const Offset(0, 15)
    )
];

// PATHS

const String _imagesFolders = 'assets/images';

const String animalsImagesPath = '$_imagesFolders/animals';
const String iconsImagesPath = '$_imagesFolders/icons';
const String questionAndCorrectImagesPath =  '$_imagesFolders/questionAndCorrect';
const String statesImagesPath = '$_imagesFolders/states';
