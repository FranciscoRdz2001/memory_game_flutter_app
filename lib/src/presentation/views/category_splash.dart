import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/constants.dart';
import 'package:memoram_app/src/core/utils/custom_animation.dart';
import 'package:memoram_app/src/core/utils/responsive.dart';
import 'package:memoram_app/src/core/utils/styles.dart';
import 'package:memoram_app/src/data/models/category_model.dart';
import 'package:memoram_app/src/presentation/views/game_page.dart';
import 'package:memoram_app/src/presentation/widgets/flexible_grid_view.dart';
import 'package:memoram_app/src/provider/game_logic_provider.dart';
import 'package:provider/provider.dart';


class CategorySpash extends StatefulWidget {

  const CategorySpash({Key? key}) : super(key: key);

  @override
  State<CategorySpash> createState() => _CategorySpashState();
}

class _CategorySpashState extends State<CategorySpash> with SingleTickerProviderStateMixin{

  late final CustomAnimation _splashAnimation;
  bool? _animationIsInReverse;

  @override
  void initState() {
    super.initState();
    _splashAnimation = CustomAnimation(
      tickerProvider: this, 
      duration: const Duration(milliseconds: 500), 
      start: 0,
      end: 1,
      animationListener: animationListener,
      animationStatusListener: animationStatusListener
    );
    _animationIsInReverse = false;
    _splashAnimation.start();
  }

  void animationListener(){
    setState(() {

    });
  }

  void animationStatusListener(AnimationStatus status) async{
    if(status == AnimationStatus.reverse){
      _animationIsInReverse = true;
    }

    if(status == AnimationStatus.dismissed && _animationIsInReverse!){
      Navigator.pushReplacementNamed(
        context,
        '/gamePage',
      );
      // Navigator.popAndPushNamed(context, '/gamePage');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _splashAnimation.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final GameLogicProvider logicProvider = Provider.of<GameLogicProvider>(context);
    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    
    final CategoryModel category = logicProvider.category;
    final String imagePath = '$iconsImagesPath/${category.icon}.png';

    final int imagesPerRowInGrid = category.images!.length ~/ 2;
    final int rowsInGrid = category.images!.length ~/ imagesPerRowInGrid;

    final double yPositionInReverse = _animationIsInReverse! ? lerpDouble(-resp.hp(38), 0, _splashAnimation.value)! : 0;
    final double borderRadius = lerpDouble(1000, 0, _splashAnimation.value)!;

    return Scaffold(
      body: Transform.translate(
        offset: Offset(0, yPositionInReverse),
        child: Opacity(
          opacity: _splashAnimation.value,
          child: Transform.scale(
            scale: _splashAnimation.value,
            child: Container(
              height: resp.height,
              width: resp.width,
              decoration: BoxDecoration(
                color: logicProvider.category.bgColor,
                borderRadius: BorderRadius.circular(borderRadius)
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: resp.lPadding,
                        horizontal: resp.tPadding
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(
                            flex: 2,
                            child: SizedBox()
                          ),
                          Expanded(
                            flex: 3,
                            child: _splashAnimation.value > 0.2 ? Image.asset(
                              imagePath, 
                              fit: BoxFit.contain,
                            ) : const SizedBox()
                          ),
                          Text(category.title, textAlign: TextAlign.center, style: TextStyles.w700(resp.dp(4), Colors.white)),
                          Text(category.description, textAlign: TextAlign.center, style: TextStyles.w700(resp.dp(1.5), Colors.white)),
                          SizedBox(height: resp.separatorHeight),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: resp.hp(7.5) * rowsInGrid,
                              width: resp.wp(16) * imagesPerRowInGrid,
                              child: Column(
                                children: [
                                  FlexibleGridView(
                                    crossAxisCount: imagesPerRowInGrid,
                                    items: List.generate(category.images!.length, (index) {
                                      return Container(
                                        decoration: const BoxDecoration(
                                          color: containerBG,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(category.images![index]),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: resp.separatorHeight),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: _animationIsInReverse! ? () {} : () {
                                _splashAnimation.reverse();
                              },
                              child: Container(
                                width: resp.width,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: accent,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text('Start game', style: TextStyles.w700(resp.dp(2), Colors.white)),
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 2,
                            child: SizedBox()
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}