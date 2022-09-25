import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_snackbar.dart';
import '../widgets/custom_title_header.dart';
import '../../data/models/animal_model.dart';
import '../../game_logic/game_logic.dart';
import '../../game_logic/game_states.dart';
import '../../styles/styles.dart';
import '../../core/utils/responsive.dart';
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

    final Size size = MediaQuery.of(context).size;
    final GameLogic game = Provider.of<GameLogic>(context);

    final ResponsiveUtil resp = ResponsiveUtil.of(context);
    
    game.context = context;

    Widget showData(){
      return game.images!.isEmpty ? const CircularProgressIndicator() : SizedBox(
        height: size.height * 0.28,
        width: size.width,
        child: GridView.builder(
          shrinkWrap: false,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: game.images!.length % 2 == 0 ? game.images!.length ~/ 2 : game.images!.length ~/ 3 , mainAxisSpacing: size.height * 0.006, mainAxisExtent: size.height * 0.1),
          itemCount: game.images!.length,
          itemBuilder: (_, x){
            ImageModel animal = game.images![x];
            return GestureDetector(
              onTap: (){
                switch (game.gameState) {
                  case GameStates.won:
                    CustomSnackBar(context: context, color: Colors.green, message: "¡El juego ya ha terminado!");
                    break;
                  case GameStates.notStarted:
                    CustomSnackBar(context: context, color: Colors.red, message: "¡No se ha iniciado el juego!");
                    break;
                  default:
                    if(game.images![x].isSelected) {
                      CustomSnackBar(context: context, color: Colors.red, message: "¡Este ya ha sido seleccionado!");
                    } else if(game.checkState == CheckStates.comparing) {
                      CustomSnackBar(context: context, color: Colors.red, message: "¡Se estan comparando los resultados anteriores!");
                    } else {
                      game.addImageToList(x);
                    }
                    break;
                }
              },
              child: AnimatedContainer(
                height: size.height * 0.2,
                width: size.width * 0.35,
                duration: const Duration(milliseconds: 250),
                transformAlignment: FractionalOffset.center,
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()..setEntry(3, 2, 0.002)..rotateY(pi * animal.animationValue ),
                curve: Curves.easeInCirc,
                child: Image.asset(animal.currentImage),
              ),
            );
          },
        ),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomTitleHeader(title: "Movimientos ${game.movements}", subTitle: "Pares ${(game.correctImages == null ? 0 : game.correctImages! ~/ 2)}", color: game.gameState == GameStates.notStarted ? Colors.blue : game.comparisonStatus == ComparisonStatus.correct ? Colors.green : game.comparisonStatus == ComparisonStatus.incorrect ? Colors.red : Colors.blue),
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.05, left: size.width * 0.05, right: size.width * 0.05),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text((game.correctImages == null ? 0 : game.correctImages! ~/ 2).toString(), style: TextStyles.w700(resp.wp(1)), textAlign: TextAlign.center,),
                    SizedBox(height: size.height * 0.005),
                    Text("Empieza a seleccionar imagenes!", style: TextStyles.w400(resp.wp(1)), textAlign: TextAlign.center),
                    showData(),
                    SizedBox(height: size.height * 0.01),
                    Text("Cambiar el tamaño. ${game.imagesToShow}.", style: TextStyles.w300(resp.wp(1)), textAlign: TextAlign.center),
                    Slider(
                      value: game.imagesToShow.toDouble() / 2,
                      min: 1.0,
                      max: game.imagesQuantity.toDouble(),
                      divisions: 7,
                      onChanged: (double newValue) => setState(() => game.changeGameSize(newValue.toInt())),
                      activeColor: Colors.blue.withOpacity(0.75),
                      inactiveColor: Colors.blue.withOpacity(0.15),
                    ),
                    CustomButton(size: size, isTrue: game.gameState == GameStates.started, enabledColor: Colors.green, icon: Icons.gamepad_rounded, text: "Iniciar Juego", onPressEvent: () async{
                      if(game.gameState == GameStates.notStarted){
                        await game.start();
                        CustomSnackBar(context: context, color: Colors.green, message: "¡El juego ha comenzado!");
                      } else {
                        CustomSnackBar(context: context, color: Colors.red, message: "¡El juego ya ha empezado!");
                      }
                    }),
                    SizedBox(height: size.height * 0.01),
                    CustomButton(size: size, isTrue: true, enabledColor: Colors.red, icon: Icons.restore_rounded, text: "Reiniciar Juego", onPressEvent: () async{
                      await game.restart();
                      CustomSnackBar(context: context, color: Colors.green, message: "¡Se ha reiniciado el juego!");
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}