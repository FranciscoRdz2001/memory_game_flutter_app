import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/constants.dart';
import 'package:memoram_app/src/core/utils/responsive.dart';

import '../../core/utils/styles.dart';
import 'header_painter.dart';

export 'package:flutter/material.dart';
export '../../core/utils/styles.dart';

class CustomScaffoldWithHeader extends StatelessWidget {

  final bool? withoutHeader;
  final Widget? beforeTitleWidget;

  final String title;
  final String subTitle;
  final List<Widget> Function(ResponsiveUtil resp)? getWidgets;

  const CustomScaffoldWithHeader({
    Key? key,
    this.withoutHeader,
    this.beforeTitleWidget,
    required this.title,
    required this.subTitle,
    
    this.getWidgets
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    final Color textColor = withoutHeader ?? false ? black : Colors.white;

    Widget getBody(){
      return Padding(
        padding: EdgeInsets.only(
          left: resp.lPadding,
          right: resp.rPadding,
          top: resp.tPadding
        ),
        child: SizedBox(
          width: resp.width,
          height: resp.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    children: [
                      if(beforeTitleWidget != null) ...[
                        beforeTitleWidget!,
                        SizedBox(height: resp.separatorHeight / 2),
                      ],
                      Text(title, textAlign: TextAlign.center, style: TextStyles.w700(resp.dp(2.85), textColor), maxLines: 2, overflow: TextOverflow.ellipsis),
                      Text(subTitle, textAlign: TextAlign.center, style: TextStyles.w400(resp.dp(1.25), textColor), maxLines: 2, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ),

              if(getWidgets != null)
                for(final widget in getWidgets!(resp))...[
                  SizedBox(height: resp.separatorHeight),
                  widget
                ]
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: withoutHeader ?? false ? getBody() : CustomPaint(
        painter: const HeaderPainter(),
        child: getBody()
      ),
    );
  }
}