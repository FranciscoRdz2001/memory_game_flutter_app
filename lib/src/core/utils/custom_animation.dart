import 'package:flutter/material.dart';

class CustomAnimation{

  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final VoidCallback? animationListener;
  late final void Function(AnimationStatus status)? animationStatusListener;

  double get value => _animation.value;
  AnimationStatus get status => _controller.status;
  Duration get duration => _controller.duration!;


  CustomAnimation({
    required SingleTickerProviderStateMixin tickerProvider,
    required Duration duration,
    required double start,
    required double end,
    required this.animationListener,
    this.animationStatusListener,
    bool? reverse,
  }){
    _controller = AnimationController(vsync: tickerProvider, duration: duration);
    _animation = Tween<double>(begin: start, end: end).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ))
      ..addListener(animationListener!);

    if(animationStatusListener != null){
      _controller.addStatusListener(animationStatusListener!);
    }
    if(reverse ?? false){
      _controller.repeat(reverse: true);
    }
  }

  void start() => _controller.forward();
  void restart() => _controller.reset();
  void reverse() => _controller.reverse();

  void dispose(){
    _controller.removeListener(animationListener!);

    if(animationStatusListener != null){
      _controller.removeStatusListener(animationStatusListener!);
    }
  }
}