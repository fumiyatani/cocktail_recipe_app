import 'package:cocktail_recipe_app/data/api/cocktail_search_api_impl.dart';
import 'package:cocktail_recipe_app/data/api/entity/cocktails.dart';
import 'package:cocktail_recipe_app/domain/cocktail_model.dart';
import 'package:cocktail_recipe_app/screens/list/cocktail_expansion_panel_item.dart';
import 'package:cocktail_recipe_app/screens/list/cocktail_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CocktailListPage extends StatefulWidget {
  CocktailListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CocktailListPage createState() => _CocktailListPage();
}

class _CocktailListPage extends State<CocktailListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Cocktail recipe'),
      ),
      body: Column(
        children: [
          SearchBar(),
          _buildExpansionPanelList(),
        ],
      ),
    );
  }

  /// 開閉可能なリスト Item を作成する
  Widget _buildExpansionPanelList() {
    return Flexible(
      child: ListView(
        children: [
          Consumer<CocktailModel>(builder: (BuildContext context, CocktailModel cocktailModel, child) {
            return ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                cocktailModel.onChangeDescriptionTextVisibility(index, !isExpanded);
              },
              children: cocktailModel.items
                  .map<ExpansionPanel>((CocktailExpansionPanelItem cocktailItem) => _buildExpansionPanel(cocktailItem))
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

class SearchBar extends StatefulWidget {
  @override
  State createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  // テキストフィールドの管理用コントローラを作成
  final searchBarController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchBarController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildSearchIcon(),
        _buildSearchKeywordInputTextField(),
        _buildClearButton(),
      ],
    );
  }

  Widget _buildSearchIcon() {
    return const Icon(Icons.search, size: 35.0);
  }

  Widget _buildSearchKeywordInputTextField() {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          onSubmitted: (inputText) => {_searchCocktails(inputText)},
          controller: searchBarController,
          decoration: InputDecoration(
            hintText: "Input Cocktail name",
          ),
        ),
      ),
    );
  }

  Widget _buildClearButton() {
    return IconButton(
      onPressed: () {
        context.read<CocktailModel>().onRemoveAll();
        searchBarController.clear();
      },
      icon: Icon(Icons.clear),
    );
  }

  Future<void> _searchCocktails(String searchKeyword) async {
    if (searchKeyword.isEmpty) {
      return;
    }

    Cocktails result = await CocktailSearchApiImpl().searchCocktails(searchKeyword);

    context.read<CocktailModel>().onUpdateCocktailExpansionPanelItemList(
        result.cocktails.map((cocktail) => cocktail.toExpansionPanelItem()).toList());
  }
}
