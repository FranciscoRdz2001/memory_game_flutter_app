import 'package:memoram_app/src/core/utils/constants.dart';
import 'package:memoram_app/src/presentation/widgets/custom_category_image_container.dart';
import 'package:memoram_app/src/presentation/widgets/custom_scaffold_with_header.dart';
import 'package:memoram_app/src/presentation/widgets/flexible_grid_view.dart';
import 'package:memoram_app/src/presentation/widgets/image_container.dart';
import 'package:memoram_app/src/provider/game_logic_provider.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {

  const GamePage({
    Key? key
  }) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>{

  final int _maxPairNumberOfColumns = 4;
  final int _maxOddNumberOfColumns = 5;
  @override
  Widget build(BuildContext context) {

    final GameLogicProvider logicProvider = Provider.of<GameLogicProvider>(context);
    final String imagePath = '$iconsImagesPath/${logicProvider.category.icon}.png';

    final int imagesQuantity = logicProvider.imagesQuantity;

    return CustomScaffoldWithHeader(
      title: logicProvider.category.title, 
      subTitle: logicProvider.category.description,
      withoutHeader: true,
      beforeTitleWidget: CustomCategoryImageContainer(
        flex: 1,
        path: imagePath,
        category: logicProvider.category,
      ),
      getWidgets: (resp) {
        return [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Images quantity: ',
                  style: TextStyles.w400(resp.dp(1.5)),
                  children: <TextSpan> [
                    TextSpan(
                      text: logicProvider.imagesQuantity.toString(),
                      style: TextStyles.w400(resp.dp(1.5), accent)
                    )
                  ]
                ),
              ),
              Slider(
                value: logicProvider.imagesQuantity.toDouble(),
                max: logicProvider.category.images!.length.toDouble() * 2,
                divisions: logicProvider.category.images!.length - 1,
                min: 2,
                thumbColor: accent,
                activeColor: accent.withOpacity(0.5),
                onChanged: ((value) {
                  logicProvider.imagesQuantity = value.truncate();
                }),
              ),
            ],
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              child: Column(
                children: [
                  FlexibleGridView(
                    crossAxisCount: (imagesQuantity % 2 == 0) ? _maxPairNumberOfColumns : _maxOddNumberOfColumns,
                    items: List.generate(logicProvider.mixedImages!.length , (x) => ImageContainer(image: logicProvider.mixedImages![x])) 
                  )
                ],
              ),
            ),
          )
        ];
      },
    );
  }
}