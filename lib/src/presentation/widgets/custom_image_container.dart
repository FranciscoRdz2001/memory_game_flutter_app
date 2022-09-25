import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/responsive.dart';


class CustomImageContainer extends StatefulWidget {
  
  // Variables
  final String animalImage;
  final Function(CustomImageContainer container) onPressEvent;


  const CustomImageContainer({
    Key? key,
    required this.animalImage, 
    required this.onPressEvent
  }) : super(key: key);


  @override
  State<CustomImageContainer> createState() => _CustomImageContainerState();
}

class _CustomImageContainerState extends State<CustomImageContainer> with TickerProviderStateMixin {
  final double _startAnimationValue = 0;
  final double _endOfAnimation = 1;
  double _animationValue = 0;


  String? _currentImage;

  final String _questionImage = "images/questionAndCorrect/question.png";
  bool canPress = true;


  _CustomImageContainerState(){
    _currentImage = _questionImage;
  }

  restore(BuildContext context) => setState(() => _animationValue = _startAnimationValue);

  @override
  Widget build(BuildContext context) {

    final ResponsiveUtil resp = ResponsiveUtil.of(context);

    return GestureDetector(
      onTap: (){
        widget.onPressEvent(widget);
        canPress = false;
        setState(() => _animationValue = _endOfAnimation);
      },
      child: AnimatedContainer(
        height: resp.hp(20),
        width: resp.wp(35),
        duration: const Duration(milliseconds: 500),
        transformAlignment: FractionalOffset.center,
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()..setEntry(3, 2, 0.002)..rotateY(pi * _animationValue),
        curve: Curves.easeInCirc,
        onEnd: (){
          canPress = true;
          setState(() => _currentImage);
        },
        child: Image.asset(_currentImage!),
      ),
    );
  }
}