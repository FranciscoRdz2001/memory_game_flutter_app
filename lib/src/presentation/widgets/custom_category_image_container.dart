import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/constants.dart';
import 'package:memoram_app/src/data/models/category_model.dart';


class CustomCategoryImageContainer extends StatelessWidget {
  
  final CategoryModel category;
  final String path;

  final Color? definedColor;
  final int? flex;

  final bool? withoutHero;

  const CustomCategoryImageContainer({
    Key? key,
    this.withoutHero,
    this.definedColor,
    this.flex,
    required this.path,
    required this.category
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Widget getBody(){
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: category.bgColor ?? containerBG,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Image.asset(path, fit: BoxFit.contain)
      );
    }

    return Expanded(
      flex: flex ?? 1,
      child: withoutHero == null || (withoutHero != null && !withoutHero!) ? Hero(
        tag: path,
        child: getBody()
      ) : getBody()
    );
  }
}