import 'dart:convert';

import 'package:cocktail_recipe_app/data/api/cocktail_search_api.dart';
import 'package:cocktail_recipe_app/data/api/cocktail_search_service.dart';
import 'package:cocktail_recipe_app/data/api/entity/cocktails.dart';
import 'package:http/http.dart';

class CocktailSearchApiImpl with CocktailSearchApi {
  CocktailSearchApiImpl(this._client);

  final Client _client;

  /// カクテル一覧を取得するAPI
  /// キーワード検索のみ対応
  /// TODO Result 欲しい
  @override
  Future<Cocktails> searchCocktails(String word) async {
    final chopperResponse = await CocktailSearchService.create(createCocktailChopper()).searchCocktails(word);

    if (chopperResponse.isSuccessful) {
      // Response<Cocktails> で上手くパースできないため http を使っている時と同じようにパースをする
      return Cocktails.fromJson(jsonDecode(chopperResponse.bodyString));
    } else {
      // todo エラー処理
    }

    final response = await _client.get(Uri.https("cocktail-f.com", "api/v1/cocktails"));

    if (response.statusCode != 200) {
      // TODO 後でエラー処理をする
    }

    // TODO JSON パース時のエラーはどうする
    return Cocktails.fromJson(jsonDecode(response.body));
  }
}
