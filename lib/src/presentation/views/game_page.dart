import 'package:memoram_app/src/core/utils/constants.dart';
import 'package:memoram_app/src/core/utils/custom_animation.dart';
import 'package:memoram_app/src/presentation/widgets/custom_category_image_container.dart';
import 'package:memoram_app/src/presentation/widgets/custom_scaffold_with_header.dart';
import 'package:memoram_app/src/presentation/widgets/flexible_grid_view.dart';
import 'package:memoram_app/src/presentation/widgets/animated_image_container.dart';
import 'package:memoram_app/src/presentation/widgets/game_information_container.dart';
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
      title: logicProvider.category.title, 
      subTitle: logicProvider.category.description,
      withScroll: false,
      beforeTitleWidget: CustomCategoryImageContainer(
        withoutHero: false,
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
                              const GameInformationContainer(text: 'Time', data: '0:30'),
                              GameInformationContainer(text: 'Movements', data: logicProvider.movements.toString()),
                              GameInformationContainer(text: 'Wrong', data: logicProvider.movements.toString()),
                              GameInformationContainer(text: 'Correct', data: logicProvider.movements.toString())
                            ],
                          ),
                          SizedBox(height: resp.separatorHeight),
                          Expanded(
                            child: FlexibleGridView(
                              crossAxisCount: elementsInRow,
                              items: List.generate(
                                logicProvider.mixedImages!.length, 
                                (x) => AnimatedImageContainer(image: logicProvider.mixedImages![x])
                              )
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ];
      }),
    );
  }
}