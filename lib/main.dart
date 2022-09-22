import 'package:flutter/material.dart';
import 'package:memoram_app/game_logic/GameLogic.dart';
import 'package:memoram_app/screens/HomePage.dart';
import 'package:provider/provider.dart';
import 'screens/HomePage.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => GameLogic(context: context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white
        ),
        title: 'Memorama',
        home: HomePage(),
      ),
    );
  }
}