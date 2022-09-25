import 'package:flutter/material.dart';
import 'package:memoram_app/game_logic/ImagesCategories.dart';
import 'package:memoram_app/styles/styles.dart';
import 'package:memoram_app/utils/responsive.dart';


class CategoryContainer extends StatelessWidget {

  final Category category;

  const CategoryContainer({
    Key? key,
    required this.category
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ResponsiveUtil resp = ResponsiveUtil.of(context);

    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset("images/icons/${category.icon}.png", fit: BoxFit.contain)
          )
        ),
        SizedBox(height: resp.hp(1)),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(category.title, style: TextStyles.w500(resp.dp(1.5)), overflow: TextOverflow.ellipsis),
              Text(category.description, textAlign: TextAlign.center, style: TextStyles.w300(resp.dp(1.25), Colors.grey), overflow: TextOverflow.ellipsis, maxLines: 2),
            ],
          ),
        )
      ],
    );
  }
}