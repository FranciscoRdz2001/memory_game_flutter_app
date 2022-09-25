import 'package:flutter/material.dart';
import 'package:memoram_app/styles/styles.dart';
import 'package:memoram_app/utils/responsive.dart';

class CustomTitleHeader extends StatelessWidget {

  final String title;
  final String subTitle;
  final Color color;

  const CustomTitleHeader({required this.title, required this.subTitle, required this.color});

  @override
  Widget build(BuildContext context) {

    final Size _size = MediaQuery.of(context).size;
    final ResponsiveUtil resp = ResponsiveUtil.of(context);

    return AnimatedContainer(
      duration: new Duration(milliseconds: 250),
      height: _size.height * 0.25,
      width: _size.width, 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, textAlign: TextAlign.center, style: TextStyles.w700(resp.dp(2.85), Colors.white)),
          Text(subTitle, textAlign: TextAlign.center, style: TextStyles.w400(resp.dp(1.25), Colors.white)),
        ],
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.75),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
    );
  }
}