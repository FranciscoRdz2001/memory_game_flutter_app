import 'package:flutter/material.dart';
import '../../core/utils/styles.dart';
import '../../core/utils/responsive.dart';

class CustomTitleHeader extends StatelessWidget {

  final String title;
  final String subTitle;
  final Color color;

  const CustomTitleHeader({ 
    Key? key,
    required this.title, 
    required this.subTitle, 
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ResponsiveUtil resp = ResponsiveUtil.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: resp.hp(25),
      width: resp.width, 
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, textAlign: TextAlign.center, style: TextStyles.w700(resp.dp(2.85), Colors.white)),
          Text(subTitle, textAlign: TextAlign.center, style: TextStyles.w400(resp.dp(1.25), Colors.white)),
        ],
      ),
    );
  }
}