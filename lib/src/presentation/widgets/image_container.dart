import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/constants.dart';


class ImageContainer extends StatefulWidget {
  const ImageContainer({Key? key}) : super(key: key);

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> with SingleTickerProviderStateMixin{

  late final AnimationController? _controller;
  late final Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.decelerate
    ))..addListener(_animationListener);
  }

  void _animationListener(){
    setState(() {
      
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
        transform: Matrix4.identity()..rotateY(pi * (_animation == null ? 0 : _animation!.value)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: containerBG,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: shadows
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}