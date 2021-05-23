import 'package:cocktail_recipe_app/data/api/cocktail_search_api_impl.dart';
import 'package:cocktail_recipe_app/data/api/cocktail_search_service.dart';
import 'package:cocktail_recipe_app/domain/cocktail_list_use_case.dart';
import 'package:cocktail_recipe_app/screens/list/cocktail_list_page.dart';
import 'package:cocktail_recipe_app/screens/list/cocktail_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CocktailListViewModel(
        // todo Injection のやり方が微妙なので改善する
        CocktailListUseCase(
          CocktailSearchApiImpl(
            CocktailSearchService.create(createCocktailChopper()),
          ),
        ),
      ),
      child: MyApp(),
    ),
  );
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
