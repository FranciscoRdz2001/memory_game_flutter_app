import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/constants.dart';
import 'package:memoram_app/src/core/utils/responsive.dart';
import 'package:memoram_app/src/core/utils/styles.dart';


class GameInformationContainer extends StatelessWidget {

  final int? flex;
  final String text;
  final String data;

  const GameInformationContainer({
    Key? key,
    this.flex = 1,
    required this.text,
    required this.data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ResponsiveUtil resp = ResponsiveUtil.of(context);

    return Expanded(
      child: Column(
        children: [
          SizedBox(height: resp.separatorHeight / 4),
          Text(text, style: TextStyles.w300(resp.dp(1.5)), textAlign: TextAlign.center),
          Text(data, style: TextStyles.w600(resp.dp(2), accent)),
        ],
      ),
    );
  }
}