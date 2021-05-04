import 'dart:convert';

import 'package:cocktail_recipe_app/data/api/cocktail_search_api.dart';
import 'package:cocktail_recipe_app/data/api/entity/cocktails.dart';
import 'package:http/http.dart' as http;

class CocktailSearchApiImpl with CocktailSearchApi {
  CocktailSearchApiImpl();

  /// カクテル一覧を取得するAPI
  /// キーワード検索のみ対応
  /// TODO Result 欲しい
  @override
  Future<Cocktails> searchCocktails(String word) async {
    final response =
        await http.get(Uri.https("cocktail-f.com", "api/v1/cocktails"));

    if (response.statusCode != 200) {
      // TODO 後でエラー処理をする
    }

    // TODO JSON パース時のエラーはどうする
    return Cocktails.fromJson(jsonDecode(response.body));
  }
}
