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
  List<Map<String, dynamic>> items = [];

  //　テキストフィールドに入力されたアイテムをリストに追加（投稿ボタンが押されたときに呼び出す関数）
  void _addItem(String inputText) {
    setState(() {
      items.add({"title": inputText});
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

                    return new Card(
                      child: ListTile(
                        leading: Icon(Icons.dehaze_outlined),
                        title: Text(item["title"]),
                      ),
                    );
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
}
