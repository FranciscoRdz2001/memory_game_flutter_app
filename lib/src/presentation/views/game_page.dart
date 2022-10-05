import 'package:memoram_app/src/core/utils/constants.dart';
import 'package:memoram_app/src/core/utils/custom_animation.dart';
import 'package:memoram_app/src/presentation/widgets/custom_category_image_container.dart';
import 'package:memoram_app/src/presentation/widgets/custom_scaffold_with_header.dart';
import 'package:memoram_app/src/presentation/widgets/flexible_grid_view.dart';
import 'package:memoram_app/src/presentation/widgets/image_container.dart';
import 'package:memoram_app/src/provider/game_logic_provider.dart';
import 'package:provider/provider.dart';


class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with SingleTickerProviderStateMixin{

  late final CustomAnimation _startAnimation;

  @override
  void initState() {
    super.initState();
    _startAnimation = CustomAnimation(
      tickerProvider: this,
      duration: const Duration(milliseconds: 500), 
      start: 0, 
      end: 1, 
      animationListener: animationListener
    )..start();
  }

  void animationListener(){
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {

    final GameLogicProvider logicProvider = Provider.of<GameLogicProvider>(context);

    final String imagePath = '$iconsImagesPath/${logicProvider.category.icon}.png';
    
    const int maxPairNumberOfColumns = 4;
    const int maxOddNumberOfColumns = 5;

    final int elementsInRow = (logicProvider.mixedImages!.length % 2) == 0 ? maxPairNumberOfColumns : maxOddNumberOfColumns; 

    return CustomScaffoldWithHeader(
      withoutHeader: true,
      title: logicProvider.category.title, 
      subTitle: logicProvider.category.description,
      beforeTitleWidget: CustomCategoryImageContainer(
        withoutHero: true,
        flex: 1,
        path: imagePath,
        category: logicProvider.category,
      ),
      getWidgets: ((resp) {
        return [
          Expanded(
            flex: 2,
            child: Opacity(
              opacity: _startAnimation.value,
              child: Transform.translate(
                offset: Offset(0, resp.hp(20) * (1 - _startAnimation.value)),
                child: Transform.scale(
                  scale: _startAnimation.value,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Text('Game information:', style: TextStyles.w600(resp.dp(2))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(height: resp.separatorHeight / 4),
                                    Text('Time', style: TextStyles.w300(resp.dp(1.5)), textAlign: TextAlign.center),
                                    Text('0:30', style: TextStyles.w600(resp.dp(2), accent)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(height: resp.separatorHeight / 4),
                                    Text('Movements', style: TextStyles.w300(resp.dp(1.5)), textAlign: TextAlign.center),
                                    Text(logicProvider.movements.toString(), style: TextStyles.w600(resp.dp(2), accent)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(height: resp.separatorHeight / 4),
                                    Text('Wrong', style: TextStyles.w300(resp.dp(1.5)), textAlign: TextAlign.center),
                                    Text(logicProvider.movements.toString(), style: TextStyles.w600(resp.dp(2), accent)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(height: resp.separatorHeight / 4),
                                    Text('Correct', style: TextStyles.w300(resp.dp(1.5)), textAlign: TextAlign.center),
                                    Text(logicProvider.movements.toString(), style: TextStyles.w600(resp.dp(2), accent)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: resp.separatorHeight),
                          FlexibleGridView(
                            crossAxisCount: elementsInRow,
                            items: List.generate(
                              logicProvider.mixedImages!.length, 
                              (x) => ImageContainer(image: logicProvider.mixedImages![x])
                            )
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: resp.separatorHeight / 2)
        ];
      }),
    );
  }
}