
import 'entity/Cocktails.dart';

/// 通信処理の
mixin CocktailSearchApi {
  Future<Cocktails> searchCocktails(String word);
}