import 'package:cocktail_recipe_app/domain/CocktailModel.dart';
import 'package:cocktail_recipe_app/ui/cocktail_expansion_panel_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("ExpantionPanelで使うChangeNotifierのテスト", () {
    test("初期値は0個", () {
      CocktailModel cocktailModel = CocktailModel();
      expect(cocktailModel.items.length, 0);
    });

    test("3個リスト追加", () {
      CocktailModel cocktailModel = CocktailModel();
      cocktailModel.addListener(() {
        expect(cocktailModel.items.length, 3);
        expect(cocktailModel.items.first.name, "名前1");
        expect(cocktailModel.items.first.contentText, "説明文1");
        expect(cocktailModel.items.first.isExpanded, false);
      });

      cocktailModel.onUpdateCocktailExpansionPanelItemList([
        CocktailExpansionPanelItem(name: "名前1", contentText: "説明文1"),
        CocktailExpansionPanelItem(name: "名前2", contentText: "説明文2"),
        CocktailExpansionPanelItem(name: "名前3", contentText: "説明文3"),
      ]);
    });

    test("リスト最初の説明文表示用フラグを変更可能", () {
      CocktailModel cocktailModel = CocktailModel();
      cocktailModel.onUpdateCocktailExpansionPanelItemList([
        CocktailExpansionPanelItem(name: "名前1", contentText: "説明文1"),
      ]);
      cocktailModel.addListener(() {
        expect(cocktailModel.items.first.isExpanded, true);
      });
      cocktailModel.onChangeDescriptionTextVisibility(0, true);
    });

    test("リスト番号が-1の場合はエラー", () {
      CocktailModel cocktailModel = CocktailModel();
      cocktailModel.onUpdateCocktailExpansionPanelItemList([
        CocktailExpansionPanelItem(name: "名前1", contentText: "説明文1"),
      ]);
      expect(() => cocktailModel.onChangeDescriptionTextVisibility(-1, true),
          throwsA(TypeMatcher<Exception>()));
    });

    test("リストの要素を全て削除できる", () {
      CocktailModel cocktailModel = CocktailModel();
      cocktailModel.addListener(() {
        expect(cocktailModel.items.length, 0);
      });
      cocktailModel.onRemoveAll();
    });
  });
}
