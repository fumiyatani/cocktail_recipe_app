import 'package:chopper/chopper.dart';
import 'package:cocktail_recipe_app/data/api/cocktail_search_api.dart';
import 'package:cocktail_recipe_app/data/api/cocktail_search_api_impl.dart';
import 'package:cocktail_recipe_app/data/api/cocktail_search_service.dart';
import 'package:cocktail_recipe_app/data/api/cocktails_json_converter.dart';
import 'package:cocktail_recipe_app/data/api/entity/cocktails.dart';
import 'package:cocktail_recipe_app/domain/cocktail_list_use_case.dart';
import 'package:cocktail_recipe_app/screens/list/cocktail_list_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as mock_test;
import 'package:mockito/annotations.dart';

// FIXME: 何のテストをしているのかわからなくなっているので ViewModel のテストなのか Networking のテストなのか観点を考えて分ける。
@GenerateMocks([http.Client, CocktailListUseCase])
void main() {
  group('ExpansionPanelで使うChangeNotifierのテスト', () {
    test('初期値は0個', () async {
      // MockClient の Response を設定
      final mockClient = mock_test.MockClient((request) async {
        return http.Response(emptyResultJsonData, 200);
      });

      // ChopperClient に MockClient を追加して ChopperService を生成
      final CocktailSearchApi mockApi = CocktailSearchApiImpl(CocktailSearchService.create(ChopperClient(
        baseUrl: 'https://cocktail-f.com',
        converter: CocktailsJsonConverter(),
        interceptors: <dynamic>[HttpLoggingInterceptor()],
        client: mockClient,
      )));

      // API通信を起動
      final result = await mockApi.searchCocktails('test');
      expect(result.cocktails.length, 0);

      final mockUseCase = CocktailListUseCase(mockApi);
      var cocktailListViewModel = CocktailListViewModel(mockUseCase);
      expect(cocktailListViewModel.items.length, 0);
    });

    // test('3個リスト追加', () async {
    //   final MockClient mockClient = MockClient();
    //   when(
    //     mockClient.get(Uri.https('cocktail-f.com', 'api/v1/cocktails')),
    //   ).thenAnswer((_) async => http.Response(testSuccessJsonData, 200,
    //       headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'}));
    //
    //   final CocktailSearchApi mockApi = CocktailSearchApiImpl(mockClient);
    //   final result = await mockApi.searchCocktails('test');
    //   expect(result.cocktails.length, 3);
    //
    //   // final CocktailListUseCase mockUseCase = CocktailListUseCase(mockApi);
    //   final CocktailListUseCase mockUseCase = MockCocktailListUseCase();
    //   when(
    //     mockUseCase.searchCocktails('searchKeyword'),
    //   ).thenAnswer((_) async => Future(() {
    //         return Cocktails(status: '0000', totalPages: 1, currentPage: 1, cocktails: [
    //           Cocktail(
    //               cocktailId: 1,
    //               cocktailName: 'cocktailName',
    //               cocktailNameEnglish: 'cocktailNameEnglish',
    //               baseName: 'baseName',
    //               techniqueName: 'techniqueName',
    //               tasteName: 'tasteName',
    //               styleName: 'styleName',
    //               alcohol: 1,
    //               topName: 'topName',
    //               glassName: 'glassName',
    //               typeName: 'typeName',
    //               cocktailDigest: 'cocktailDigest',
    //               cocktailDesc: 'cocktailDesc',
    //               recipeDesc: 'recipeDesc',
    //               recipes: [Recipe(ingredientId: 1, ingredientName: 'ingredientName', amount: 'amount', unit: 'unit')])
    //         ]);
    //       }));
    //
    //   CocktailListViewModel cocktailListViewModel = CocktailListViewModel(mockUseCase);
    //   cocktailListViewModel.addListener(() {
    //     expect(cocktailListViewModel.items.length, 1);
    //   });
    //   cocktailListViewModel.onSearchCocktail('searchKeyword');
    // });

    //   test("リスト最初の説明文表示用フラグを変更可能", () {
    //     CocktailListViewModel cocktailListViewModel = CocktailListViewModel();
    //     // cocktailListViewModel.onUpdateCocktailExpansionPanelItemList([
    //     //   CocktailExpansionPanelItem(name: "名前1", contentText: "説明文1"),
    //     // ]);
    //     cocktailListViewModel.addListener(() {
    //       expect(cocktailListViewModel.items.first.isExpanded, true);
    //     });
    //     cocktailListViewModel.onChangeDescriptionTextVisibility(0, true);
    //   });
    //
    //   test("リスト番号が-1の場合はエラー", () {
    //     CocktailListViewModel cocktailListViewModel = CocktailListViewModel();
    //     // cocktailListViewModel.onUpdateCocktailExpansionPanelItemList([
    //     //   CocktailExpansionPanelItem(name: "名前1", contentText: "説明文1"),
    //     // ]);
    //     expect(() => cocktailListViewModel.onChangeDescriptionTextVisibility(-1, true),
    //         throwsA(TypeMatcher<Exception>()));
    //   });
    //
    //   test("リストの要素を全て削除できる", () {
    //     CocktailListViewModel cocktailListViewModel = CocktailListViewModel();
    //     cocktailListViewModel.addListener(() {
    //       expect(cocktailListViewModel.items.length, 0);
    //     });
    //     cocktailListViewModel.onRemoveAll();
    //   });
  });
}

class MockSearchApi with CocktailSearchApi {
  @override
  Future<Cocktails> searchCocktails(String keyword) {
    return Future(() {
      return Cocktails(status: '0000', totalPages: 1, currentPage: 1, cocktails: []);
    });
  }
}

const String emptyResultJsonData = '''
{
  "status": "0000",
  "total_pages": 5,
  "current_page": 1,
  "cocktails": []
}
''';

const String testSuccessJsonData = '''
{
  "status": "0000",
  "total_pages": 5,
  "current_page": 1,
  "cocktails": [
    {
      "cocktail_id": 1,
      "cocktail_name": "マティーニ",
      "cocktail_name_english": "Martini",
      "base_name": "ジン",
      "technique_name": "ステア",
      "taste_name": "辛口",
      "style_name": "ショート",
      "alcohol": 42,
      "top_name": "食前",
      "glass_name": "カクテルグラス",
      "type_name": "アルコール",
      "cocktail_digest": "カクテルの王様",
      "cocktail_desc": "ジンの辛味とドライベルモットの香りが絶妙なカクテルの王様。時代が進むにつれ辛口へと変化している。使用するお酒の種類や配合が無数にあるため、バーによって味が異なると言われている。カクテル好きなら1度は味わっておきたい一杯。",
      "recipe_desc": "ジンとドライベルモットをミキシンググラスでステアし、グラスに注ぐ。オリーブをカクテルピックに刺して沈め、仕上げにレモンピールをふる。",
      "recipes": [
        {
          "ingredient_id": 1,
          "ingredient_name": "ジン",
          "amount": "50",
          "unit": "ml"
        },
        {
          "ingredient_id": 15,
          "ingredient_name": "ドライ・ベルモット",
          "amount": "10",
          "unit": "ml"
        },
        {
          "ingredient_id": 47,
          "ingredient_name": "オリーブ",
          "amount": "1",
          "unit": "個"
        },
        {
          "ingredient_id": 48,
          "ingredient_name": "レモン・ピール",
          "amount": "",
          "unit": "適量"
        }
      ]
    },
    {
      "cocktail_id": 2,
      "cocktail_name": "テキーラ・サンライズ",
      "cocktail_name_english": "Tequila Sunrise",
      "base_name": "テキーラ",
      "technique_name": "ビルド",
      "taste_name": "中甘口",
      "style_name": "ロング",
      "alcohol": 13,
      "top_name": "オール",
      "glass_name": "ゴブレット",
      "type_name": "アルコール",
      "cocktail_digest": "日の出をイメージした美しいカクテル",
      "cocktail_desc": "グレナデン・シロップとオレンジジュースのグラデーションで日の出を表現した美しいカクテル。テキーラ独特の風味とオレンジジュースがマッチした一品。",
      "recipe_desc": "グラスに氷、テキーラ、オレンジジュースを入れてステア（混ぜる）する。グレナデン・シロップを氷に当たらないよう静かに注いで沈めた後、きれいなグラデーションとなるようにバー・スプーンで持ち上げるように混ぜる。",
      "recipes": [
        {
          "ingredient_id": 3,
          "ingredient_name": "テキーラ",
          "amount": "45",
          "unit": "ml"
        },
        {
          "ingredient_id": 34,
          "ingredient_name": "オレンジ・ジュース",
          "amount": "",
          "unit": "FullUP"
        },
        {
          "ingredient_id": 49,
          "ingredient_name": "グレナデン・シロップ",
          "amount": "2",
          "unit": "tsp."
        }
      ]
    },
    {
      "cocktail_id": 3,
      "cocktail_name": "ジン・トニック",
      "cocktail_name_english": "Gin Tonic",
      "base_name": "ジン",
      "technique_name": "ビルド",
      "taste_name": "中辛口",
      "style_name": "ロング",
      "alcohol": 16,
      "top_name": "オール",
      "glass_name": "タンブラー",
      "type_name": "アルコール",
      "cocktail_digest": "ジンの良さをを気軽に楽しめる王道のカクテル",
      "cocktail_desc": "ジンとトニックウォーターをビルドするシンプルなレシピ。家でも簡単に作れる上、さっぱりして飲みやすい。シンプルかつスタンダードなカクテルが故にバーテンダーの腕が出やすいとされる。なお、トニックウォーターだけでは甘すぎる場合は炭酸水を半分入れたジン・ソニックというカクテルもある。",
      "recipe_desc": "グラスに氷を入れてジン注ぎ、その後冷えたトニック・ウォーターでグラスを満たし、炭酸が抜けないよう軽くステアする。最後にカットしたライムを飾り付ける。",
      "recipes": [
        {
          "ingredient_id": 1,
          "ingredient_name": "ジン",
          "amount": "45",
          "unit": "ml"
        },
        {
          "ingredient_id": 35,
          "ingredient_name": "トニック・ウォーター",
          "amount": "",
          "unit": "FullUP"
        },
        {
          "ingredient_id": 50,
          "ingredient_name": "ライム",
          "amount": "1/6",
          "unit": "個"
        }
      ]
    }
  ]
}
''';
