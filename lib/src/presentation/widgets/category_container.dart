import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/constants.dart';
import 'package:palette_generator/palette_generator.dart';
import '../../game_logic/images_categories.dart';
import '../../core/utils/styles.dart';
import '../../core/utils/responsive.dart';
import 'bubbles_painter.dart';


class CategoryContainer extends StatelessWidget {
  
  final Category category;

  const CategoryContainer({
    Key? key,
    required this.category
  }) : super(key: key);

  Future<PaletteGenerator>_updatePaletteGenerator() async{
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.asset('$iconsImagesPath/${category.icon}.png').image,
    );
    return paletteGenerator;
  }

  @override
  Widget build(BuildContext context) {

    final ResponsiveUtil resp = ResponsiveUtil.of(context);

    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: resp.lPadding / 4, vertical: resp.tPadding / 8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              boxShadow: shadows
            ),
            child: FutureBuilder<PaletteGenerator>(
              future: _updatePaletteGenerator(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                
                Color categoryContainerColor = Colors.grey[100]!;

                if(snapshot.connectionState == ConnectionState.done) {
                  if (!snapshot.hasError){
                    final face = snapshot.data.dominantColor.color;
                    categoryContainerColor = face;
                  }
                }

                return Column(
                  children: [
                    Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: categoryContainerColor,
                          borderRadius: BorderRadius.circular(10)

                        ),
                        child: Image.asset('$iconsImagesPath/${category.icon}.png', fit: BoxFit.contain)
                      )
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: resp.hp(1)),
                          Text(category.title, style: TextStyles.w500(resp.dp(1.5)), overflow: TextOverflow.ellipsis),
                          Text(category.description, textAlign: TextAlign.center, style: TextStyles.w300(resp.dp(1.25), Colors.grey), overflow: TextOverflow.ellipsis, maxLines: 2),
                        ],
                      ),
                    )
                  ]
                );
              },
            )
          )
        ),
      ],
    );
  }
}