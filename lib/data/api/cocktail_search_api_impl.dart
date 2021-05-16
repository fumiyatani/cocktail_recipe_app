import 'dart:convert';

import 'package:cocktail_recipe_app/data/api/cocktail_search_api.dart';
import 'package:cocktail_recipe_app/data/api/cocktail_search_service.dart';
import 'package:cocktail_recipe_app/data/api/entity/cocktails.dart';

class CocktailSearchApiImpl with CocktailSearchApi {
  CocktailSearchApiImpl(this._cocktailSearchService);

  final CocktailSearchService _cocktailSearchService;

  /// カクテル一覧を取得するAPI
  /// キーワード検索のみ対応
  /// TODO Result 欲しい
  @override
  Future<Cocktails> searchCocktails(String word) async {
    final chopperResponse = await _cocktailSearchService.searchCocktails(word);

    if (chopperResponse.isSuccessful) {
      // Response<Cocktails> で上手くパースできないため http を使っている時と同じようにパースをする
      // 基本的にbodyに入ってきた時点でnullになることはないため強制アンラップする
      return chopperResponse.body!;
    } else {
      // todo エラー処理
      return Cocktails.fromJson(jsonDecode(chopperResponse.bodyString) as Map<String, dynamic>);
    }
  }
}
