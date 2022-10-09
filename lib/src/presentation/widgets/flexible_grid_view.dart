import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/styles.dart';
import '../../core/utils/responsive.dart';


class FlexibleGridView extends StatelessWidget {

  final List<Widget> items;
  final int? flex;
  final int crossAxisCount;

  const FlexibleGridView({
    Key? key,
    this.flex,
    required this.items,
    required this.crossAxisCount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ResponsiveUtil resp = ResponsiveUtil.of(context);

    return items.isNotEmpty ? LayoutBuilder(
      builder: (context, constraints) {

        return GridView.count(
          shrinkWrap: true,
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: resp.wp(4),
          mainAxisSpacing: resp.hp(1),
          clipBehavior: Clip.none,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          children: items
        );
      }
    ) : Text('GridView has no items.', style: TextStyles.w400(resp.dp(1.5), Colors.red[200]!));
  }
}