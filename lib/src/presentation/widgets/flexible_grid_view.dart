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

    return items.isNotEmpty ? Flexible(
      flex: flex ?? 1,
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: resp.wp(4),
          mainAxisSpacing: resp.hp(1)
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (_, x) => items[x]
      ),
    ) : Text('GridView has no items.', style: TextStyles.w400(resp.dp(1.5), Colors.red[200]!),);
  }
}