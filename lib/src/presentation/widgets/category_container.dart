import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:memoram_app/src/core/utils/constants.dart';
import 'package:memoram_app/src/data/models/category_model.dart';
import 'package:memoram_app/src/presentation/views/category_splash_page.dart';
import 'package:memoram_app/src/presentation/widgets/custom_category_image_container.dart';
import 'package:memoram_app/src/provider/game_logic_provider.dart';

import '../../core/utils/responsive.dart';
import '../../core/utils/styles.dart';

class CategoryContainer extends StatelessWidget {
  
  final CategoryModel category;

  const CategoryContainer({
    Key? key,
    required this.category
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    final GameLogicProvider logicProvider = Provider.of<GameLogicProvider>(context);

    final String imagePath = '$iconsImagesPath/${category.icon}.png';

    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: (){
              logicProvider.category = category;
              Navigator.push(
                context, 
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const CategorySpashPage(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: resp.lPadding / 4, vertical: resp.tPadding / 8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: containerBG,
                borderRadius: BorderRadius.circular(10),
                boxShadow: shadows
              ),
              child: Column(
                children: [
                  CustomCategoryImageContainer(
                    withoutHero: true,
                    path: imagePath, 
                    category: category,
                    flex: 13
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 10,
                    child: Column(
                      children: [
                        Text(category.title, style: TextStyles.w500(resp.dp(1.5)), overflow: TextOverflow.ellipsis),
                        Text(category.description, textAlign: TextAlign.center, style: TextStyles.w300(resp.dp(1.25), Colors.grey), overflow: TextOverflow.ellipsis, maxLines: 2),
                      ],
                    ),
                  ),
                ]
              )
            ),
          )
        ),
      ],
    );
  }
}