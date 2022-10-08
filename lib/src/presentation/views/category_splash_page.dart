import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/constants.dart';
import 'package:memoram_app/src/core/utils/custom_animation.dart';
import 'package:memoram_app/src/core/utils/responsive.dart';
import 'package:memoram_app/src/core/utils/styles.dart';
import 'package:memoram_app/src/data/models/category_model.dart';
import 'package:memoram_app/src/presentation/views/game_configuration_page.dart';
import 'package:memoram_app/src/presentation/views/game_page.dart';
import 'package:memoram_app/src/presentation/widgets/flexible_grid_view.dart';
import 'package:memoram_app/src/provider/game_logic_provider.dart';
import 'package:provider/provider.dart';


class CategorySpashPage extends StatefulWidget {

  const CategorySpashPage({Key? key}) : super(key: key);

  @override
  State<CategorySpashPage> createState() => _CategorySpashPageState();
}

class _CategorySpashPageState extends State<CategorySpashPage> with SingleTickerProviderStateMixin{

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
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => const GameConfigurationPage()
        )
      );
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

    final double yPositionInReverse = _animationIsInReverse! ? -resp.hp(35) * (1 - _splashAnimation.value) : 0;

    late final double borderRadius;
    late final double containerWidth;

    if(_animationIsInReverse!){
      borderRadius = lerpDouble(10, 0, _splashAnimation.value)!;
      final double maxWidth = resp.width - (resp.lPadding + resp.rPadding);
      containerWidth = lerpDouble(maxWidth, resp.width, _splashAnimation.value)!;
    }
    else{
      borderRadius = lerpDouble(1000, 0, _splashAnimation.value)!;
      containerWidth = lerpDouble(resp.wp(50), resp.width, _splashAnimation.value)!;
    }

    final double containerHeight = lerpDouble(resp.hp(20), resp.height, _splashAnimation.value)!;
    final double topAndBottomPadding = resp.tPadding * _splashAnimation.value;
    final double heightBetweenBodyWidgets = (containerHeight * 0.02) * _splashAnimation.value;

    return Scaffold(
      body: Center(
        child: Transform.translate(
          offset: Offset(0, _animationIsInReverse! ? yPositionInReverse : 0),
          child: Hero(
            tag: imagePath,
            child: Container(
              height: containerHeight,
              width: containerWidth,
              padding: EdgeInsets.symmetric(horizontal: resp.lPadding),
              decoration: BoxDecoration(
                color: category.bgColor,
                borderRadius: BorderRadius.circular(borderRadius)
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Column(
                      children: [
                        SizedBox(height: topAndBottomPadding),
                        Expanded(
                          flex: 15,
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  imagePath, 
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          )
                        ),
                        Container(
                          height: (containerHeight * 0.5) * _splashAnimation.value,
                          width: containerWidth,
                          alignment: Alignment.topCenter,
                          child: SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                Text(category.title, textAlign: TextAlign.center, style: TextStyles.w700(resp.dp(4), Colors.white)),
                                Text(category.description, textAlign: TextAlign.center, style: TextStyles.w700(resp.dp(1.5), Colors.white)),
                                SizedBox(height: heightBetweenBodyWidgets),
                                SizedBox(
                                  height: (containerHeight * 0.075) * rowsInGrid,
                                  width: (containerWidth * 0.16) * imagesPerRowInGrid,
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
                                SizedBox(height: heightBetweenBodyWidgets),
                                GestureDetector(
                                  onTap: _animationIsInReverse! ? () {} : () {
                                    _splashAnimation.reverse();
                                  },
                                  child: Container(
                                    width: containerWidth * 0.9,
                                    height: containerHeight * 0.075,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: accent,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text('Configure game', style: TextStyles.w700(resp.dp(2), Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: topAndBottomPadding),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // return Scaffold(
    //   body: Transform.translate(
    //     offset: Offset(0, yPositionInReverse),
    //     child: Opacity(
    //       opacity: _splashAnimation.value,
    //       child: Transform.scale(
    //         scale: _splashAnimation.value,
    //         child: Container(
    //           height: resp.height,
    //           width: resp.width,
    //           decoration: BoxDecoration(
    //             color: logicProvider.category.bgColor,
    //             borderRadius: BorderRadius.circular(borderRadius)
    //           ),
    //           child: Stack(
    //             children: [
    //               Align(
    //                 alignment: Alignment.center,
    //                 child: Padding(
    //                   padding: EdgeInsets.symmetric(
    //                     vertical: resp.lPadding,
    //                     horizontal: resp.tPadding
    //                   ),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       const Expanded(
    //                         flex: 2,
    //                         child: SizedBox()
    //                       ),
    //                       Expanded(
    //                         flex: 3,
    //                         child: _splashAnimation.value > 0.2 ? Image.asset(
    //                           imagePath, 
    //                           fit: BoxFit.contain,
    //                         ) : const SizedBox()
    //                       ),
    //                       Text(category.title, textAlign: TextAlign.center, style: TextStyles.w700(resp.dp(4), Colors.white)),
    //                       Text(category.description, textAlign: TextAlign.center, style: TextStyles.w700(resp.dp(1.5), Colors.white)),
    //                       SizedBox(height: resp.separatorHeight),
    //                       Expanded(
    //                         flex: 2,
    //                         child: SizedBox(
    //                           height: resp.hp(7.5) * rowsInGrid,
    //                           width: resp.wp(16) * imagesPerRowInGrid,
    //                           child: Column(
    //                             children: [
    //                               FlexibleGridView(
    //                                 crossAxisCount: imagesPerRowInGrid,
    //                                 items: List.generate(category.images!.length, (index) {
    //                                   return Container(
    //                                     decoration: const BoxDecoration(
    //                                       color: containerBG,
    //                                       shape: BoxShape.circle,
    //                                     ),
    //                                     child: Image.asset(category.images![index]),
    //                                   );
    //                                 }),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                       SizedBox(height: resp.separatorHeight),
    //                       Expanded(
    //                         flex: 1,
    //                         child: GestureDetector(
    //                           onTap: _animationIsInReverse! ? () {} : () {
    //                             _splashAnimation.reverse();
    //                           },
    //                           child: Container(
    //                             width: resp.width,
    //                             alignment: Alignment.center,
    //                             decoration: BoxDecoration(
    //                               color: accent,
    //                               borderRadius: BorderRadius.circular(10)
    //                             ),
    //                             child: Text('Configure game', style: TextStyles.w700(resp.dp(2), Colors.white)),
    //                           ),
    //                         ),
    //                       ),
    //                       const Expanded(
    //                         flex: 2,
    //                         child: SizedBox()
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}