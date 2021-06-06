import 'package:cocktail_recipe_app/screens/list/cocktail_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktail recipe',
      theme: ThemeData.dark(),
      home: CocktailListPage(),
    );
  }
}
