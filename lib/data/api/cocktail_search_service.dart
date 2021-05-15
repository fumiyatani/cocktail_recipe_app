import 'package:chopper/chopper.dart';

import 'entity/cocktails.dart';

part 'cocktail_search_service.chopper.dart';

final String _cocktailBaseUrl = "https://cocktail-f.com";

/// カクテル情報を取得するAPI定義
@ChopperApi(baseUrl: "/api/v1")
abstract class CocktailSearchService extends ChopperService {
  // ignore: lines_longer_than_80_chars
  static CocktailSearchService create([ChopperClient? client]) => _$CocktailSearchService(client);

  /// カクテル一覧を取得
  @Get(path: "/cocktails")
  Future<Response<Cocktails>> searchCocktails(@Query("word") String word,
      {@Query("page") int page = 1, @Query("limit") int limit = 100});
}

/// Chopper のインスタンスを生成するためのメソッド
ChopperClient createCocktailChopper() {
  return ChopperClient(baseUrl: _cocktailBaseUrl, converter: JsonConverter());
}
