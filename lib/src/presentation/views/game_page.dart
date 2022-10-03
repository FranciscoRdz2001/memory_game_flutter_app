import 'package:memoram_app/src/core/utils/constants.dart';
import 'package:memoram_app/src/presentation/widgets/custom_category_image_container.dart';
import 'package:memoram_app/src/presentation/widgets/custom_scaffold_with_header.dart';
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

  @override
  Widget build(BuildContext context) {

    final GameLogicProvider logicProvider = Provider.of<GameLogicProvider>(context);

    // Widget showData(){
    //   return game.images!.isEmpty ? const CircularProgressIndicator() : SizedBox(
    //     height: resp.hp(28),
    //     child: GridView.builder(
    //       shrinkWrap: false,
    //       physics: const NeverScrollableScrollPhysics(),
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: game.images!.length % 2 == 0 ? game.images!.length ~/ 2 : game.images!.length ~/ 3 , 
    //         mainAxisSpacing: resp.hp(0.6), 
    //         mainAxisExtent: resp.hp(1)
    //       ),
    //       itemCount: game.images!.length,
    //       itemBuilder: (_, x){
    //         ImageModel animal = game.images![x];
    //         return GestureDetector(
    //           onTap: (){
    //             switch (game.gameState) {
    //               case GameStates.won:
    //                 CustomSnackBar(context: context, color: Colors.green, message: "¡El juego ya ha terminado!");
    //                 break;
    //               case GameStates.notStarted:
    //                 CustomSnackBar(context: context, color: Colors.red, message: "¡No se ha iniciado el juego!");
    //                 break;
    //               default:
    //                 if(game.images![x].isSelected) {
    //                   CustomSnackBar(context: context, color: Colors.red, message: "¡Este ya ha sido seleccionado!");
    //                 } else if(game.checkState == CheckStates.comparing) {
    //                   CustomSnackBar(context: context, color: Colors.red, message: "¡Se estan comparando los resultados anteriores!");
    //                 } else {
    //                   game.addImageToList(x);
    //                 }
    //                 break;
    //             }
    //           },
    //           child: AnimatedContainer(
    //             height: resp.hp(20),
    //             width: resp.wp(35),
    //             duration: const Duration(milliseconds: 250),
    //             transformAlignment: FractionalOffset.center,
    //             alignment: FractionalOffset.center,
    //             transform: Matrix4.identity()..setEntry(3, 2, 0.002)..rotateY(pi * animal.animationValue ),
    //             curve: Curves.easeInCirc,
    //             child: Image.asset(animal.currentImage),
    //           ),
    //         );
    //       },
    //     ),
    //   );
    // }

  final String imagePath = '$iconsImagesPath/${logicProvider.selectedCategory.icon}.png';
  
  return CustomScaffoldWithHeader(
    title: logicProvider.selectedCategory.title, 
    subTitle: logicProvider.selectedCategory.description,
    withoutHeader: true,
    beforeTitleWidget: CustomCategoryImageContainer(
      flex: 3,
      path: imagePath,
      category: logicProvider.selectedCategory,
    ),
    getWidgets: (resp) {
      return [
        const Expanded(
          flex: 3,
          child: SizedBox(),
        )
      ];
    },
  );

    // return Scaffold(
    //   body: SizedBox(
    //     height: resp.height,
    //     width: resp.width,
    //     child: Padding(
    //       padding: EdgeInsets.only(
    //         left: resp.lPadding,
    //         right: resp.rPadding,
    //         top: resp.tPadding
    //       ),
    //       child: LayoutBuilder(
    //         builder: (_, constraints) {
    //           return SingleChildScrollView(
    //             child: ConstrainedBox(
    //               constraints: BoxConstraints(
    //                 maxHeight: constraints.maxHeight
    //               ),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children: [
    //                   Expanded(
    //                     flex: 1,
    //                     child: Column(
    //                       children: [
    //                         SizedBox(height: resp.separatorHeight / 2),
    //                         Text('Educational Memory Game', textAlign: TextAlign.center, style: TextStyles.w700(resp.dp(2.85), Colors.white)),
    //                         Text('Start your game to start learning...', textAlign: TextAlign.center, style: TextStyles.w400(resp.dp(1.25), Colors.white)),
    //                       ],
    //                     ),
    //                   ),
    //                   SizedBox(height: resp.separatorHeight),
    //                   Text('Dashboard:', textAlign: TextAlign.center, style: TextStyles.w500(resp.dp(2.5))),
    //                   SizedBox(height: resp.separatorHeight),

    //                   // Categories Containers
    //                   SizedBox(height: resp.separatorHeight),
    //                   Text('Categories:', textAlign: TextAlign.center, style: TextStyles.w500(resp.dp(2.5))),
    //                   SizedBox(height: resp.separatorHeight),
    //                 ],
    //               ),
    //             ),
    //           );
    //         },
    //       ),
    //     ),
    //     // child: CustomPaint(
    //     //   painter: const HeaderPainter(),
    //     //   child: Column(
    //     //     children: [
    //     //       // CustomTitleHeader(title: "Movimientos ${game.movements}", subTitle: "Pares ${(game.correctImages == null ? 0 : game.correctImages! ~/ 2)}", color: game.gameState == GameStates.notStarted ? Colors.blue : game.comparisonStatus == ComparisonStatus.correct ? Colors.green : game.comparisonStatus == ComparisonStatus.incorrect ? Colors.red : Colors.blue),
    //     //       Padding(
    //     //         padding: EdgeInsets.only(
    //     //           left: resp.lPadding,
    //     //           right: resp.rPadding,
    //     //           top: resp.tPadding
    //     //         ),
    //     //         child: Column(
    //     //           children: [
    //     //             // Text((game.correctImages == null ? 0 : game.correctImages! ~/ 2).toString(), style: TextStyles.w700(resp.wp(1)), textAlign: TextAlign.center,),
    //     //             // SizedBox(height: resp.hp(percent) * 0.005),
    //     //             // Text("Empieza a seleccionar imagenes!", style: TextStyles.w400(resp.wp(1)), textAlign: TextAlign.center),
    //     //             // showData(),
    //     //             // SizedBox(height: size.height * 0.01),
    //     //             // Text("Cambiar el tamaño. ${game.imagesToShow}.", style: TextStyles.w300(resp.wp(1)), textAlign: TextAlign.center),
    //     //             // Slider(
    //     //             //   value: game.imagesToShow.toDouble() / 2,
    //     //             //   min: 1.0,
    //     //             //   max: game.imagesQuantity.toDouble(),
    //     //             //   divisions: 7,
    //     //             //   onChanged: (double newValue) => setState(() => game.changeGameSize(newValue.toInt())),
    //     //             //   activeColor: Colors.blue.withOpacity(0.75),
    //     //             //   inactiveColor: Colors.blue.withOpacity(0.15),
    //     //             // ),
    //     //             // CustomButton(size: size, isTrue: game.gameState == GameStates.started, enabledColor: Colors.green, icon: Icons.gamepad_rounded, text: "Iniciar Juego", onPressEvent: () async{
    //     //             //   if(game.gameState == GameStates.notStarted){
    //     //             //     await game.start();
    //     //             //     CustomSnackBar(context: context, color: Colors.green, message: "¡El juego ha comenzado!");
    //     //             //   } else {
    //     //             //     CustomSnackBar(context: context, color: Colors.red, message: "¡El juego ya ha empezado!");
    //     //             //   }
    //     //             // }),
    //     //             // SizedBox(height: size.height * 0.01),
    //     //             // CustomButton(size: size, isTrue: true, enabledColor: Colors.red, icon: Icons.restore_rounded, text: "Reiniciar Juego", onPressEvent: () async{
    //     //             //   await game.restart();
    //     //             //   CustomSnackBar(context: context, color: Colors.green, message: "¡Se ha reiniciado el juego!");
    //     //             // })
    //     //           ],
    //     //         ),
    //     //       ),
    //     //     ],
    //     //   ),
    //     // ),
    //   )
    // );
  }
}