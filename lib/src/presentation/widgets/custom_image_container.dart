import 'dart:math';

import 'package:flutter/material.dart';


class CustomImageContainer extends StatefulWidget {
  
  // Variables
  final String animalImage;
  final Function(CustomImageContainer container) onPressEvent;

  const CustomImageContainer({required this.animalImage, required this.onPressEvent});


  @override
  _CustomImageContainerState createState() => _CustomImageContainerState();
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

    final Size _size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){
        if(widget.onPressEvent != null) widget.onPressEvent(widget);
        canPress = false;
        setState(() => _animationValue = _endOfAnimation);
      },
      child: AnimatedContainer(
        height: _size.height * 0.2,
        width: _size.width * 0.35,
        duration: Duration(milliseconds: 500),
        transformAlignment: FractionalOffset.center,
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()..setEntry(3, 2, 0.002)..rotateY(pi * _animationValue),
        child: Image.asset(_currentImage!),
        curve: Curves.easeInCirc,
        onEnd: (){
          canPress = true;
          setState(() => _currentImage);
        },
      ),
    );
  }
}