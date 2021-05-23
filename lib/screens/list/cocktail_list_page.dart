import 'package:cocktail_recipe_app/screens/list/cocktail_expansion_panel_item.dart';
import 'package:cocktail_recipe_app/screens/list/cocktail_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CocktailListPage extends StatefulWidget {
  CocktailListPage();

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
          Consumer<CocktailListViewModel>(builder: (context, cocktailModel, child) {
            return ExpansionPanelList(
              expansionCallback: (index, isExpanded) {
                cocktailModel.onChangeDescriptionTextVisibility(index, !isExpanded);
              },
              children: cocktailModel.items
                  .map<ExpansionPanel>((cocktailItem) => _buildExpansionPanel(cocktailItem))
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
      headerBuilder: (context, isExpanded) {
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
            hintText: 'Input Cocktail name',
          ),
        ),
      ),
    );
  }

  Widget _buildClearButton() {
    return IconButton(
      onPressed: () {
        context.read<CocktailListViewModel>().onRemoveAll();
        searchBarController.clear();
      },
      icon: Icon(Icons.clear),
    );
  }

  Future<void> _searchCocktails(String searchKeyword) async {
    await context.read<CocktailListViewModel>().onSearchCocktail(searchKeyword);
  }
}
