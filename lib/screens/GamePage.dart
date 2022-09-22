import 'dart:math';
import 'package:flutter/material.dart';
import 'package:memoram_app/custom_widgets/CustomButton.dart';
import 'package:memoram_app/custom_widgets/CustomSnackBar.dart';
import 'package:memoram_app/custom_widgets/CustomTitleHeader.dart';
import 'package:memoram_app/game_logic/AnimalModel.dart';
import 'package:memoram_app/game_logic/GameLogic.dart';
import 'package:memoram_app/game_logic/GameStates.dart';
import 'package:memoram_app/styles/styles.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>{

  @override
  Widget build(BuildContext context) {

    final Size _size = MediaQuery.of(context).size;
    final GameLogic _game = Provider.of<GameLogic>(context);
    _game.context = context;

    Widget _showData(){
      return _game.images!.length == 0 ? CircularProgressIndicator() : Container(
        height: _size.height * 0.28,
        width: _size.width,
        child: GridView.builder(
          shrinkWrap: false,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: _game.images!.length % 2 == 0 ? _game.images!.length ~/ 2 : _game.images!.length ~/ 3 , mainAxisSpacing: _size.height * 0.006, mainAxisExtent: _size.height * 0.1),
          itemCount: _game.images!.length,
          itemBuilder: (_, x){
            ImageModel animal = _game.images![x];
            return GestureDetector(
              onTap: (){
                switch (_game.gameState) {
                  case GameStates.won:
                    CustomSnackBar(context: context, color: Colors.green, message: "¡El juego ya ha terminado!");
                    break;
                  case GameStates.notStarted:
                    CustomSnackBar(context: context, color: Colors.red, message: "¡No se ha iniciado el juego!");
                    break;
                  default:
                    if(_game.images![x].isSelected) CustomSnackBar(context: context, color: Colors.red, message: "¡Este ya ha sido seleccionado!");
                    else if(_game.checkState == CheckStates.comparing) CustomSnackBar(context: context, color: Colors.red, message: "¡Se estan comparando los resultados anteriores!");
                    else _game.addImageToList(x);
                    break;
                }
              },
              child: AnimatedContainer(
                height: _size.height * 0.2,
                width: _size.width * 0.35,
                duration: Duration(milliseconds: 250),
                transformAlignment: FractionalOffset.center,
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()..setEntry(3, 2, 0.002)..rotateY(pi * animal.animationValue ),
                child: Image.asset(animal.currentImage),
                curve: Curves.easeInCirc,
              ),
            );
          },
        ),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomTitleHeader(title: "Movimientos ${_game.movements}", subTitle: "Pares ${(_game.correctImages == null ? 0 : _game.correctImages! ~/ 2)}", color: _game.gameState == GameStates.notStarted ? Colors.blue : _game.comparisonStatus == ComparisonStatus.correct ? Colors.green : _game.comparisonStatus == ComparisonStatus.incorrect ? Colors.red : Colors.blue),
            Padding(
              padding: EdgeInsets.only(bottom: _size.height * 0.05, left: _size.width * 0.05, right: _size.width * 0.05),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text((_game.correctImages == null ? 0 : _game.correctImages! ~/ 2).toString(), style: TextStyles.title, textAlign: TextAlign.center,),
                    SizedBox(height: _size.height * 0.005),
                    Text("Empieza a seleccionar imagenes!", style: TextStyles.body, textAlign: TextAlign.center),
                    _showData(),
                    SizedBox(height: _size.height * 0.01),
                    Text("Cambiar el tamaño. ${_game.imagesToShow}.", style: TextStyles.bodyMessages, textAlign: TextAlign.center),
                    Slider(
                      value: _game.imagesToShow.toDouble() / 2,
                      min: 1.0,
                      max: _game.imagesQuantity.toDouble(),
                      divisions: 7,
                      onChanged: (double newValue) => setState(() => _game.changeGameSize(newValue.toInt())),
                      activeColor: Colors.blue.withOpacity(0.75),
                      inactiveColor: Colors.blue.withOpacity(0.15),
                    ),
                    CustomButton(size: _size, isTrue: _game.gameState == GameStates.started, enabledColor: Colors.green, icon: Icons.gamepad_rounded, text: "Iniciar Juego", onPressEvent: () async{
                      if(_game.gameState == GameStates.notStarted){
                        await _game.start();
                        CustomSnackBar(context: context, color: Colors.green, message: "¡El juego ha comenzado!");
                      } else CustomSnackBar(context: context, color: Colors.red, message: "¡El juego ya ha empezado!");
                    }),
                    SizedBox(height: _size.height * 0.01),
                    CustomButton(size: _size, isTrue: true, enabledColor: Colors.red, icon: Icons.restore_rounded, text: "Reiniciar Juego", onPressEvent: () async{
                      await _game.restart();
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