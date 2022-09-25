import 'package:flutter/material.dart';
import 'package:memoram_app/src/core/utils/constants.dart';
import '../../data/models/dashboard_item_model.dart';
import '../widgets/custom_title_header.dart';
import '../../game_logic/game_logic.dart';
import '../../game_logic/images_categories.dart';
import '../../core/utils/styles.dart';
import '../../core/utils/responsive.dart';
import '../widgets/category_container.dart';
import '../widgets/dashboard_container.dart';
import '../widgets/flexible_grid_view.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final CategoryInfo categories = CategoryInfo();

  List<DashboardItemModel> dashboardItems = const [
    DashboardItemModel(
      title: 'Games', value: '10', bgColor: Color(0xffB1B2FF)
    ),
    DashboardItemModel(
      title: 'Wins', value: '2', bgColor: Color(0xffAAC4FF)
    ),
    DashboardItemModel(
      title: 'Losses', value: '8', bgColor: Color(0xffEE6983)
    ),
  ];

  @override
  Widget build(BuildContext context) {

    final GameLogic game = Provider.of<GameLogic>(context);
    game.context = context;

    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: resp.lPadding,
          right: resp.rPadding,
          top: resp.tPadding
        ),
        child: LayoutBuilder(
          builder: (_, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomTitleHeader(
                      title: 'Educational Memory Game', 
                      subTitle: 'Start your game to start learning...', 
                      color: accent
                    ),
                    SizedBox(height: resp.separatorHeight),
                    Text('Dashboard:', textAlign: TextAlign.center, style: TextStyles.w500(resp.dp(2))),
                    SizedBox(height: resp.separatorHeight),

                    FlexibleGridView(
                      items: dashboardItems.map((i) => DashboardContainer(bgColor: i.bgColor, title: i.title, value: i.value)).toList(),
                      crossAxisCount: 3,
                    ),

                    // Categories Containers
                    SizedBox(height: resp.separatorHeight),
                    Text('Categories:', textAlign: TextAlign.center, style: TextStyles.w500(resp.dp(2))),
                    SizedBox(height: resp.separatorHeight),
                    FlexibleGridView(
                      items: categories.list.map((c) => CategoryContainer(category: c)).toList(),
                      crossAxisCount: 2,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}