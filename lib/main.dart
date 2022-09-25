import 'package:flutter/material.dart';
import 'package:memoram_app/game_logic/GameLogic.dart';
import 'package:memoram_app/screens/HomePage.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => GameLogic(context: context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 250, 250, 250)
        ),
        title: 'Memorama',
        home: HomePage(),
      ),
    );
  }
}