
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:cocktail_recipe_app/data/api/entity/cocktails.dart';

/// 参考URL
/// ref: https://www.raywenderlich.com/10099546-elegant-networking-in-flutter-with-chopper#toc-anchor-011
/// InternalLinkedHashMap が Cocktails? の subtype ではないというエラーになってしまうため上記を参考にこのクラスを作成
class CocktailsJsonConverter extends JsonConverter {

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return decodeJson<BodyType, InnerType>(response);
  }

  // TODO Cocktails しかコンバートできないためほかのやり方を考える
  Response<BodyType> decodeJson<BodyType, InnerType>(Response response) {
    var contentType = response.headers[contentTypeKey];
    dynamic body = response.body;

    if (contentType != null && contentType.contains(jsonHeaders)) {
      body = utf8.decode(response.bodyBytes);
    }

    try {
      var mapData = json.decode(body);
      var cocktails = Cocktails.fromJson(mapData);
      return response.copyWith<BodyType>(body: cocktails as BodyType);
    } catch (e) {
      chopperLogger.warning(e);
      return response.copyWith<BodyType>(body: body);
    }
  }
}
