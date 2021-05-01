import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

import 'cocktail_search_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktail recipe',
      theme: new ThemeData.dark(),
      home: TextFormListViewPage(),
    );
  }
}

class TextFormListViewPage extends StatefulWidget {
  TextFormListViewPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TextFormListViewPageState createState() => _TextFormListViewPageState();
}

class _TextFormListViewPageState extends State<TextFormListViewPage> {
  // テキストフィールドの管理用コントローラを作成
  final myController = TextEditingController();

  // データ格納用リスト
  List<String> items = [];

  //　テキストフィールドに入力されたアイテムをリストに追加（投稿ボタンが押されたときに呼び出す関数）
  void _addItem(String inputText) {
    setState(() {
      items.add(inputText);
    });
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
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
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
                  icon: Icon (Icons.clear),
                ),
              ],
            ),
            // リストビュー
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = items[index];

                    return createCard(item);
                  }),
            ),
          ],
        ),
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

  /// Card Widget を作成する
  /// 引数には Map を取る
  ///   { key (String型): value(dynamic型) }
  Card createCard(String item) {

    //
    // 具体例{ title (String型): 表示される文字列(dynamic型) }
    return new Card(
      child: Row(
        children: [
          Text(item),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              // IconButtonをタップした時にこの中が呼ばれる
              setState(() {
                items.remove(item);
              });
            },
          ),
        ],
      ),
    );
  }
}
