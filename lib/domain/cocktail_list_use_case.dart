import 'package:cocktail_recipe_app/data/api/cocktail_search_api.dart';
import 'package:cocktail_recipe_app/data/api/cocktail_search_api_impl.dart';
import 'package:cocktail_recipe_app/data/api/entity/cocktails.dart';

class CocktailListUseCase {

  // todo コンストラクタインジェクションをする

  CocktailSearchApi _cocktailSearchApi = CocktailSearchApiImpl();

  Future<Cocktails> searchCocktails(String searchKeyword) {
    return _cocktailSearchApi.searchCocktails(searchKeyword);
  }
}