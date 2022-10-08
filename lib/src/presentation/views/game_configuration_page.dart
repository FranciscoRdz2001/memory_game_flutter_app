import 'package:memoram_app/src/core/utils/constants.dart';
import 'package:memoram_app/src/core/utils/custom_animation.dart';
import 'package:memoram_app/src/core/utils/responsive.dart';
import 'package:memoram_app/src/presentation/widgets/custom_category_image_container.dart';
import 'package:memoram_app/src/presentation/widgets/custom_scaffold_with_header.dart';
import 'package:memoram_app/src/provider/game_logic_provider.dart';
import 'package:provider/provider.dart';

class GameConfigurationPage extends StatefulWidget {

  const GameConfigurationPage({
    Key? key
  }) : super(key: key);

  @override
  State<GameConfigurationPage> createState() => _GameConfigurationPageState();
}

class _GameConfigurationPageState extends State<GameConfigurationPage> with SingleTickerProviderStateMixin{

  late final CustomAnimation _startAnimation;

  @override
  void initState() {
    super.initState();
    _startAnimation = CustomAnimation(
      tickerProvider: this, 
      duration: const Duration(milliseconds: 500), 
      start: 0, 
      end: 1, 
      animationListener: _animationListener
    )..start();

    WidgetsBinding.instance.addPostFrameCallback((_) async{

      final logicProvider = Provider.of<GameLogicProvider>(context, listen: false);
      logicProvider.imagesQuantity = 2;
    });
  }

  void _animationListener(){
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {

    final GameLogicProvider logicProvider = Provider.of<GameLogicProvider>(context);
    final ResponsiveUtil resp = ResponsiveUtil.of(context);

    final String imagePath = '$iconsImagesPath/${logicProvider.category.icon}.png';

    final yBodyPosition = resp.hp(20) * (1 - _startAnimation.value);

    return CustomScaffoldWithHeader(
      title: logicProvider.category.title, 
      subTitle: 'Configure your game',
      withoutHeader: true,
      beforeTitleWidget: CustomCategoryImageContainer(
        withoutHero: false,
        flex: 1,
        path: imagePath,
        category: logicProvider.category,
      ),
      getWidgets: (resp) {
        return [
          Transform.translate(
            offset: Offset(0, yBodyPosition),
            child: Transform.scale(
              scale: _startAnimation.value,
              child: Column(
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/gamePage',
                      );
                    },
                    child: Container(
                      width: resp.width,
                      height: resp.hp(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: accent,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('Start game', style: TextStyles.w700(resp.dp(2), Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          )
        ];
      },
    );
  }
}