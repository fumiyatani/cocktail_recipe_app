import 'package:cocktail_recipe_app/domain/CocktailModel.dart';
import 'package:cocktail_recipe_app/ui/cocktail_expansion_panel_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("ExpantionPanelで使うChangeNotifierのテスト", () {
    test("初期値", () {
      CocktailModel cocktailModel = CocktailModel();
      expect(cocktailModel.items.length, 0);
    });

    test("リストを追加できるのか", () {
      CocktailModel cocktailModel = CocktailModel();
      cocktailModel.addListener(() {
        expect(cocktailModel.items.length, 3);
        expect(cocktailModel.items.first.name, "名前1");
        expect(cocktailModel.items.first.contentText, "説明文1");
      });

      cocktailModel.updateCocktailExpansionPanelItemList([
        CocktailExpansionPanelItem(name: "名前1", contentText: "説明文1"),
        CocktailExpansionPanelItem(name: "名前2", contentText: "説明文2"),
        CocktailExpansionPanelItem(name: "名前3", contentText: "説明文3"),
      ]);
    });

    test("リストの要素を全て削除できるか", () {
      CocktailModel cocktailModel = CocktailModel();
      cocktailModel.addListener(() {
        expect(cocktailModel.items.length, 0);
      });
      cocktailModel.removeCocktailExpansionPanelItemList();
    });
  });
}
