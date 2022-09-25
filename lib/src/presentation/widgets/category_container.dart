import 'package:flutter/material.dart';
import '../../game_logic/images_categories.dart';
import '../../styles/styles.dart';
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