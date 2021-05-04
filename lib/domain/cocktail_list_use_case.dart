import 'package:cocktail_recipe_app/data/api/cocktail_search_api.dart';
import 'package:cocktail_recipe_app/data/api/entity/cocktails.dart';

class CocktailListUseCase {

  CocktailListUseCase(this._cocktailSearchApi);

  final CocktailSearchApi _cocktailSearchApi;

  Future<Cocktails> searchCocktails(String searchKeyword) {
    return _cocktailSearchApi.searchCocktails(searchKeyword);
  }
}