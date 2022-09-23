import 'package:flutter/material.dart';
import 'package:memoram_app/custom_widgets/CustomAlertMessage.dart';
import 'package:memoram_app/custom_widgets/CustomImageFolder.dart';
import 'package:memoram_app/custom_widgets/CustomTitleHeader.dart';
import 'package:memoram_app/game_logic/GameLogic.dart';
import 'package:memoram_app/game_logic/ImagesCategories.dart';
import 'package:memoram_app/screens/GamePage.dart';
import 'package:memoram_app/styles/styles.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {

  final CategoryInfo categories = new CategoryInfo();

  Widget build(BuildContext context) {

    final GameLogic _game = Provider.of<GameLogic>(context);
    _game.context = context;

    final Size _size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: _size.height * 0.02, bottom: _size.height * 0.05, left: _size.width * 0.05, right: _size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTitleHeader(title: "Memorama Educativo", subTitle: "Inicia tu juego para comenzar con el aprendizaje", color: Colors.blueAccent),
              Text("Categorias disponibles:", textAlign: TextAlign.center, style: TextStyles.body),
              Text("Selecciona la que quieras jugar.", style: TextStyles.bodyMessages),
              SizedBox(height: _size.height * 0.015),
              // Container(
              //   height: _size.height * 0.61,
              //   width: _size.width,
              //   child: ListView.builder(
              //     physics: NeverScrollableScrollPhysics(),
              //     itemCount: categories.list.length,
              //     padding: EdgeInsets.all(0),
              //     itemBuilder: (_, x)
              //       => Padding(
              //         padding: EdgeInsets.only(bottom: _size.height * 0.01),
              //         child: CustomImageFolder(color: Colors.red, category: categories.list[x], onTapEvent: () async{
              //           _game
              //             ..context = context
              //             ..imagesToShow = 2
              //             ..imagesType = categories.list[x].imageType;
              //           await _game.getImagesFromFolder(categories.list[x].path);
              //           if(_game.images != null && _game.images!.length > 0){
              //             _game.restart();
              //             Navigator.of(context).push(MaterialPageRoute(builder: (_) => GamePage()));
              //           }
              //           else CustomAlertMessage.showMyDialog(context, [Text("No hay imagenes en esta categoria", style: TextStyles.body.copyWith(fontSize: 15), textAlign: TextAlign.center, overflow: TextOverflow.visible)], "Error");
              //         }
              //       ),
              //     )
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}