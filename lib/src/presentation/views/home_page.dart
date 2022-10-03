import 'package:memoram_app/src/core/utils/constants.dart';
import 'package:memoram_app/src/data/models/category_model.dart';
import 'package:memoram_app/src/presentation/widgets/custom_scaffold_with_header.dart';
import 'package:memoram_app/src/provider/categories_provider.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import '../../data/models/dashboard_item_model.dart';
import '../widgets/category_container.dart';
import '../widgets/dashboard_container.dart';
import '../widgets/flexible_grid_view.dart';


class HomePage extends StatefulWidget {
  
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{

      final catProvider = Provider.of<CategoriesProvider>(context, listen: false);
      
      for(CategoryModel cat in catProvider.list){
        final String imagePath = '$iconsImagesPath/${cat.icon}.png';
        final paletteGenerator = await PaletteGenerator.fromImageProvider(
          Image.asset(imagePath).image,
        );

        final Color color = paletteGenerator.dominantColor!.color;
        catProvider.setColor(cat, color);
      }
    });
  }

  List<DashboardItemModel> dashboardItems = const [
    DashboardItemModel(
      title: 'Games', value: '10', bgColor: Color(0xffe3e4fd), icon: Icons.gamepad_rounded
    ),
    DashboardItemModel(
      title: 'Wins', value: '2', bgColor: Color(0xffe3e4fd), icon: Icons.star_rounded
    ),
    DashboardItemModel(
      title: 'Losses', value: '8', bgColor: Color(0xffe3e4fd), icon: Icons.dangerous_rounded
    ),
  ];

  @override
  Widget build(BuildContext context){

    final CategoriesProvider categoriesProvider = Provider.of<CategoriesProvider>(context);

    return CustomScaffoldWithHeader(
      title: 'Educational Memory Game', 
      subTitle: 'Start your game to start learning...',
      getWidgets: (resp) {
        return [
          Text('Dashboard:', textAlign: TextAlign.center, style: TextStyles.w500(resp.dp(2.5))),

          FlexibleGridView(
            crossAxisCount: 3,
            items: dashboardItems.map((i) => DashboardContainer(bgColor: containerBG, title: i.title, value: i.value, icon: i.icon)).toList()
          ),

          // Categories Containers
          Text('Categories:', textAlign: TextAlign.center, style: TextStyles.w500(resp.dp(2.5))),
          FlexibleGridView(
            items: categoriesProvider.list.map((c) => CategoryContainer(category: c)).toList(),
            crossAxisCount: 2,
          ),
        ];
      },
    );
  }
}