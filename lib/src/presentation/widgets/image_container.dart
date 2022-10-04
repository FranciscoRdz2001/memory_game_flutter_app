import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/constants.dart';


class ImageContainer extends StatefulWidget {

  final String image;

  const ImageContainer({
    Key? key,
    required this.image
  }) : super(key: key);

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> with SingleTickerProviderStateMixin{

  late final AnimationController? _controller;
  late final Animation<double>? _animation;
  late String _currentImage;

  @override
  void initState() {
    super.initState();
    _currentImage = questionImagePath;
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.decelerate
    ))..addListener(_animationListener);
  }

  void _animationListener(){
    setState(() {
      _currentImage = _animation!.value < 0.5 ? questionImagePath : widget.image;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _controller!.forward();
      },
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..rotateY(-pi * (_animation == null ? 0 : _animation!.value)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: containerBG,
                  shape: BoxShape.circle,
                  boxShadow: shadows
                ),
                child: Image.asset(_currentImage),
              )
            ),
          ],
        ),
      ),
    );
  }
}