import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/constants.dart';
import '../../core/utils/responsive.dart';

import '../../core/utils/styles.dart';


class DashboardContainer extends StatelessWidget {

  final Color bgColor;
  final IconData icon;
  final String title;
  final String value;

  const DashboardContainer({
    Key? key,
    required this.bgColor,
    required this.icon,
    required this.title,
    required this.value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: shadows
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: resp.dp(3), color: black),
          Text(title, textAlign: TextAlign.center, style: TextStyles.w400(resp.dp(1.25), Colors.grey)),
          Text(value, textAlign: TextAlign.center, style: TextStyles.w700(resp.dp(2), black)),
        ],
      ),
    );
  }
}