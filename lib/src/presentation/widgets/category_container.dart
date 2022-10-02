import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/constants.dart';
import '../../game_logic/images_categories.dart';
import '../../core/utils/styles.dart';
import '../../core/utils/responsive.dart';


class CategoryContainer extends StatelessWidget {

  const CategoryContainer({
    Key? key,
    required this.category
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {

    final ResponsiveUtil resp = ResponsiveUtil.of(context);

    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: resp.lPadding / 2, vertical: resp.tPadding / 3),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              boxShadow: shadows
            ),
            child: Column(children: [
              Expanded(
                child: Image.asset('$iconsImagesPath/${category.icon}.png', fit: BoxFit.contain)
              ),
              SizedBox(height: resp.hp(1)),
              Text(category.title, style: TextStyles.w500(resp.dp(1.5)), overflow: TextOverflow.ellipsis),
              Text(category.description, textAlign: TextAlign.center, style: TextStyles.w300(resp.dp(1.25), Colors.grey), overflow: TextOverflow.ellipsis, maxLines: 2),
            ])
          )
        ),
      ],
    );
  }
}