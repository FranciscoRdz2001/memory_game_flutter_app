import 'package:flutter/material.dart';
import 'package:memoram_app/src/presentation/views/category_splash_page.dart';
import 'package:memoram_app/src/presentation/views/game_configuration_page.dart';
import 'package:memoram_app/src/presentation/views/game_page.dart';
import 'package:memoram_app/src/provider/categories_provider.dart';
import 'package:memoram_app/src/provider/game_logic_provider.dart';
import 'package:provider/provider.dart';

import 'src/presentation/views/home_page.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GameLogicProvider>(create: (_) => GameLogicProvider()),
        ChangeNotifierProvider<CategoriesProvider>(create: (_) => CategoriesProvider(context)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xfff8fafd)
        ),
        title: 'Memorama',
        home: const HomePage(),
        routes: {
          '/homePage' : (context) => const HomePage(), 
          '/categorySplash' : (context) => const CategorySpashPage(),
          '/gameConfigurationPage' : (context) => const GameConfigurationPage(),
          '/gamePage' : (context) => const GamePage(),
        },
      ),
    );
  }
}