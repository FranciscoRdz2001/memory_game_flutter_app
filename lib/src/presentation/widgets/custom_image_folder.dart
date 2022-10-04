import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/constants.dart';
import 'package:memoram_app/src/data/models/category_model.dart';
import '../../core/utils/styles.dart';
import '../../core/utils/responsive.dart';

class CustomImageFolder extends StatelessWidget {

  final Function() onTapEvent;
  final CategoryModel category;

  CustomImageFolder({
    Key? key,
    required this.category, 
    required this.onTapEvent
  }) :super(key: key){
    getColors();
  }

  void getColors() async{
  }

  @override
  Widget build(BuildContext context) {

    final ResponsiveUtil resp = ResponsiveUtil.of(context);

    return GestureDetector(
      onTap: onTapEvent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: resp.lPadding * 0.5, vertical: resp.tPadding * 0.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: shadows
            ),
            child: Image.asset("images/icons/${category.icon}.png", height: resp.hp(20), width: resp.wp(37), fit: BoxFit.contain),
          ),
          SizedBox(height: resp.tPadding / 2),
          Text(category.title, textAlign: TextAlign.start, style: TextStyles.w500(resp.dp(1.75)), overflow: TextOverflow.ellipsis),
          Text(category.description, textAlign: TextAlign.start, style: TextStyles.w300(resp.dp(1.25), Colors.grey), overflow: TextOverflow.ellipsis, maxLines: 2),
        ],
      ),
    );
  }
}