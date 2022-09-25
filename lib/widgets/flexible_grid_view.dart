import 'package:flutter/material.dart';
import 'package:memoram_app/utils/responsive.dart';


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

    return Flexible(
      flex: flex ?? 1,
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: resp.wp(4),
          mainAxisSpacing: resp.hp(1)
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (_, x) => items[x]
      ),
    );
  }
}