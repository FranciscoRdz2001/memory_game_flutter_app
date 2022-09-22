import 'package:flutter/material.dart';
import 'package:memoram_app/game_logic/ImagesCategories.dart';
import 'package:memoram_app/styles/styles.dart';

class CustomImageFolder extends StatelessWidget {

  final Function() onTapEvent;
  final Category category;
  final Color color;
  const CustomImageFolder({required this.category, required this.onTapEvent, required this.color});

  @override
  Widget build(BuildContext context) {

    final Size _size = MediaQuery.of(context).size; 

    return GestureDetector(
      onTap: onTapEvent,
      child: Container(
        height: _size.height * 0.15,
        width: _size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: category.color.withOpacity(0.15),
          border: Border.all(color: color.withOpacity(0.30), width: _size.height * 0.00015)
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: _size.width * 0.03),
              child: Container(decoration: BoxDecoration(color: category.color[100], borderRadius: BorderRadius.circular(25)), child: Image.asset("images/icons/${category.icon}.png", height: _size.height * 0.12, width: _size.width * 0.25))
            ),
            SizedBox(width: _size.width * 0.015),
            Padding(
              padding: EdgeInsets.only(top: _size.height * 0.020, left: _size.width * 0.025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: _size.width * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(category.title, textAlign: TextAlign.start, style: TextStyles.containerName, overflow: TextOverflow.ellipsis),
                        Text(category.description, textAlign: TextAlign.start, style: TextStyles.containerBody, overflow: TextOverflow.visible),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}