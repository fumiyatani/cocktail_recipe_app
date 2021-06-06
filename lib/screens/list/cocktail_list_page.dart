import 'package:cocktail_recipe_app/screens/detail/cocktail_detail_page.dart';
import 'package:cocktail_recipe_app/screens/list/cocktail_expansion_panel_item.dart';
import 'package:cocktail_recipe_app/screens/list/cocktail_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Provider を使うために HookWidget を設定
// これにより useProvider<T> が使用できる
class CocktailListPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // ViewModelのインジェクション
    final cocktailListViewModel = useProvider<CocktailListViewModel>(cocktailListViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Cocktail recipe'),
      ),
      body: Column(
        children: [
          SearchBar(
            onSubmitted: (searchKeyword) {
              print(searchKeyword);
              cocktailListViewModel.onSearchCocktail(searchKeyword);
            },
            onPressedClear: () {
              cocktailListViewModel.onRemoveAll();
            },
          ),
          _buildExpansionPanelList(context),
        ],
      ),
    );
  }

  Widget _buildExpansionPanelList(BuildContext context) {
    final cocktailListViewModel = useProvider<CocktailListViewModel>(cocktailListViewModelProvider);

    return Flexible(
      child: ListView(
        children: [
          ExpansionPanelList(
            expansionCallback: (index, isExpanded) {
              cocktailListViewModel.onChangeDescriptionTextVisibility(index, !isExpanded);
            },
            children: cocktailListViewModel.items
                .map<ExpansionPanel>((cocktailItem) => _buildExpansionPanel(cocktailItem, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  // 開閉可能な ExpansionPanel の Item を作成する
  ExpansionPanel _buildExpansionPanel(CocktailExpansionPanelItem cocktailItem, BuildContext context) {
    return ExpansionPanel(
      headerBuilder: (context, isExpanded) {
        // カクテル名が表示されるタイトル部分
        return ListTile(
          title: Text(cocktailItem.name),
        );
      },
      // カクテルの情報が表示されるボディ部分
      body: Column(
        children: [
          ListTile(
            title: Text(cocktailItem.contentText),
            subtitle: Text(cocktailItem.contentText),
          ),
          TextButton(
            onPressed: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => CocktailDetailPage(cocktailId: cocktailItem.cocktailId),
                ),
              );
            },
            child: Text('詳細'),
          ),
        ],
      ),
      isExpanded: cocktailItem.isExpanded,
    );
  }
}

class SearchBar extends StatefulWidget {
  SearchBar({
    required this.onSubmitted,
    required this.onPressedClear,
  });

  final ValueChanged<String> onSubmitted;
  final VoidCallback onPressedClear;

  @override
  State createState() => _SearchBarState(onSubmitted, onPressedClear);
}

class _SearchBarState extends State<SearchBar> {
  _SearchBarState(
    this.onSubmitted,
    this.onPressedClear,
  );

  final ValueChanged<String> onSubmitted;
  final VoidCallback onPressedClear;

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
          // onSubmitted: (inputText) => {_searchCocktails(inputText)},
          onSubmitted: (inputText) => onSubmitted(inputText),
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
        searchBarController.clear();
        onPressedClear();
      },
      icon: Icon(Icons.clear),
    );
  }
}
