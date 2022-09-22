import 'package:flutter/material.dart';
import 'package:memoram_app/styles/styles.dart';

class CustomTitleHeader extends StatelessWidget {

  String title;
  String subTitle;
  Color color;

  CustomTitleHeader({@required this.title, @required this.subTitle, @required this.color});

  @override
  Widget build(BuildContext context) {

    final Size _size = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: new Duration(milliseconds: 250),
      height: _size.height * 0.25,
      width: _size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, textAlign: TextAlign.center, style: TextStyles.title),
          Text(subTitle, textAlign: TextAlign.center, style: TextStyles.subTitle),
        ],
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.75),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
    );
  }
}