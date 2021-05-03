import 'package:cocktail_recipe_app/data/api/cocktail_search_api_impl.dart';
import 'package:cocktail_recipe_app/data/api/entity/Cocktails.dart';
import 'package:cocktail_recipe_app/ui/cocktail_expansion_panel_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktail recipe',
      theme: new ThemeData.dark(),
      home: CocktailListPage(),
    );
  }
}

class CocktailListPage extends StatefulWidget {
  CocktailListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CocktailListPage createState() => _CocktailListPage();
}

class _CocktailListPage extends State<CocktailListPage> {
  // テキストフィールドの管理用コントローラを作成
  final myController = TextEditingController();

  // カクテル情報格納リスト
  List<CocktailExpansionPanelItem> cocktailExpansionPanelItemList = [];

  // 通信結果
  Future<Cocktails> futureCocktails;

  //　テキストフィールドに入力されたアイテムをリストに追加（投稿ボタンが押されたときに呼び出す関数）
  Future<void> _addItem(String inputText) async {
    futureCocktails = CocktailSearchApiImpl().searchCocktails(inputText);
    setState(() {});
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
          Flexible(
            child: ListView(
              children: [
                FutureBuilder<Cocktails>(
                  future: futureCocktails,
                  builder: (BuildContext context, AsyncSnapshot<Cocktails> snapshot) {
                    debugPrint("通信処理 FutureBuilder: ${snapshot.data}");
                    if (snapshot.hasData) {
                      return _buildExpansionPanelList(
                        snapshot.data.cocktails.map((cocktail) =>
                            CocktailExpansionPanelItem(
                                name: cocktail.cocktailName,
                                contentText: cocktail.cocktailDesc)).toList(),
                      );
                    } else if (snapshot.hasError) {
                      return Text("エラー発生");
                    } else {
                      return Text("まだ検索してないよ");
                    }
                  },
                ),
                // _buildExpansionPanelList(),
              ],
            ),
          )
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
  Widget _buildExpansionPanelList(
      List<CocktailExpansionPanelItem> cocktailItemList) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          // indexに対応する ExpansionPanel のデータを取得して Body の表示非表示を変更する
          // もう一度setStateが走ってしまい、リストの再取得が行われ、内部的に表示フラグがたってもfalseに書き換えられてしまう。
          cocktailItemList[index].isExpanded = !isExpanded;
          debugPrint("表示非表示 : ${cocktailItemList[index].isExpanded}");
        });
      },
      children: cocktailItemList
          .map<ExpansionPanel>((CocktailExpansionPanelItem cocktailItem) =>
              _buildExpansionPanel(cocktailItem))
          .toList(),
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
