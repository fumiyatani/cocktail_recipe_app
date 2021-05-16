// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_search_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$CocktailSearchService extends CocktailSearchService {
  _$CocktailSearchService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CocktailSearchService;

  @override
  Future<Response<Cocktails>> searchCocktails(String word,
      {int page = 1, int limit = 100}) {
    final $url = '/api/v1/cocktails';
    final $params = <String, dynamic>{
      'word': word,
      'page': page,
      'limit': limit
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Cocktails, Cocktails>($request);
  }
}
