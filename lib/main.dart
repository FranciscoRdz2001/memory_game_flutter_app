import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/game_logic/game_logic.dart';
import 'src/presentation/views/home_page.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameLogic>(
      create: (BuildContext context) => GameLogic(context: context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 250, 250, 250)
        ),
        title: 'Memorama',
        home: const HomePage(),
      ),
    );
  }
}