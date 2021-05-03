import 'package:cocktail_recipe_app/domain/CocktailModel.dart';
import 'package:cocktail_recipe_app/screens/list/cocktail_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CocktailModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktail recipe',
      theme: new ThemeData.dark(),
      home: CocktailListPage(),
    );
  }
}