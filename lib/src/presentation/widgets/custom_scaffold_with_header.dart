import 'package:flutter/material.dart';

import 'package:memoram_app/src/core/utils/responsive.dart';

import '../../core/utils/styles.dart';

export '../../core/utils/styles.dart';
export 'package:flutter/material.dart';

class CustomScaffoldWithHeader extends StatelessWidget {

  final Widget? beforeTitleWidget;
  final bool? withScroll;

  final String title;
  final String subTitle;
  final List<Widget> Function(ResponsiveUtil resp)? getWidgets;

  const CustomScaffoldWithHeader({
    Key? key,
    this.beforeTitleWidget,
    this.withScroll = true,
    required this.title,
    required this.subTitle,
    
    this.getWidgets
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ResponsiveUtil resp = ResponsiveUtil.of(context);

    Widget getContent(){
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: resp.lPadding,
          vertical: resp.tPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(beforeTitleWidget != null) ...[
              beforeTitleWidget!,
              SizedBox(height: resp.separatorHeight / 2),
            ],
            SizedBox(
              height: resp.hp(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, textAlign: TextAlign.center, style: TextStyles.w700(resp.dp(3.5)), maxLines: 2, overflow: TextOverflow.ellipsis),
                  Text(subTitle, textAlign: TextAlign.center, style: TextStyles.w400(resp.dp(1.5)), maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
        
            if(getWidgets != null)
              for(Widget widget in getWidgets!(resp)) ...[
                SizedBox(height: resp.separatorHeight / 2),
                widget
              ]
          ],
        ),
      );
    }

    return Scaffold(
      body: withScroll! ? SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: getContent()
      ) : getContent(),
    );
  }
}