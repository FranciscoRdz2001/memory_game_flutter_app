import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/constants.dart';


class ImageContainer extends StatelessWidget {

  final String imagePath;
  final bool? withShadows;

  const ImageContainer({
    Key? key,
    this.withShadows,
    required this.imagePath
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerBG,
        shape: BoxShape.circle,
        boxShadow: withShadows != null && withShadows! ? shadows : []
      ),
      child: Image.asset(imagePath),
    );
  }
}