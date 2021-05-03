import 'package:cocktail_recipe_app/data/api/cocktail_search_api_impl.dart';
import 'package:cocktail_recipe_app/data/api/entity/Cocktails.dart';
import 'package:cocktail_recipe_app/domain/CocktailModel.dart';
import 'package:cocktail_recipe_app/screens/list/cocktail_expansion_panel_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CocktailListPage extends StatefulWidget {
  CocktailListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CocktailListPage createState() => _CocktailListPage();
}

class _CocktailListPage extends State<CocktailListPage> {
  // テキストフィールドの管理用コントローラを作成
  final myController = TextEditingController();

  //　テキストフィールドに入力されたアイテムをリストに追加（投稿ボタンが押されたときに呼び出す関数）
  Future<void> _addItem(String inputText) async {
    Cocktails result = await CocktailSearchApiImpl().searchCocktails(inputText);
    List<CocktailExpansionPanelItem> list = result.cocktails
        .map<CocktailExpansionPanelItem>((cocktail) =>
        CocktailExpansionPanelItem(
            name: cocktail.cocktailName,
            contentText: cocktail.cocktailDesc))
        .toList();
    context.read<CocktailModel>().onUpdateCocktailExpansionPanelItemList(list);
  }

  @override
  // widgetの破棄時にコントローラも破棄する
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void deleteTextFieldStr() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Cocktail recipe'),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildExpansionPanelList(),
        ],
      ),
      // 投稿ボタン
      floatingActionButton: FloatingActionButton(
        // onPressedでボタンが押されたらテキストフィールドの内容を取得して、アイテムに追加
        onPressed: () {
          _addItem(myController.text);
          // テキストフィールドの内容をクリア
          myController.clear();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  /// 検索バーを作成する
  Widget _buildSearchBar() {
    return Row(
      children: <Widget>[
        new Icon(Icons.search, size: 35.0),
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: myController,
              decoration: InputDecoration(
                hintText: "Input Cocktail name",
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: myController.clear,
          icon: Icon(Icons.clear),
        ),
      ],
    );
  }

  /// 開閉可能なリスト Item を作成する
  Widget _buildExpansionPanelList() {
    return Flexible(
      child: ListView(
        children: [
          Consumer<CocktailModel>(builder:
              (BuildContext context, CocktailModel cocktailModel, child) {
            return ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                cocktailModel.onChangeDescriptionTextVisibility(
                    index, !isExpanded);
                debugPrint("表示非表示 : $isExpanded");
              },
              children: cocktailModel.items
                  .map<ExpansionPanel>(
                      (CocktailExpansionPanelItem cocktailItem) =>
                      _buildExpansionPanel(cocktailItem))
                  .toList(),
            );
          })
        ],
      ),
    );
  }

  // 開閉可能な ExpansionPanel の Item を作成する
  ExpansionPanel _buildExpansionPanel(CocktailExpansionPanelItem cocktailItem) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        // カクテル名が表示されるタイトル部分
        return ListTile(
          title: Text(cocktailItem.name),
        );
      },
      // カクテルの情報が表示されるボディ部分
      body: ListTile(
        title: Text(cocktailItem.contentText),
        subtitle: Text(cocktailItem.contentText),
      ),
      isExpanded: cocktailItem.isExpanded,
    );
  }
}
