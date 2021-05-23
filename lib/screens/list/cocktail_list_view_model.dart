import 'dart:collection';

import 'package:cocktail_recipe_app/domain/cocktail_list_use_case.dart';
import 'package:cocktail_recipe_app/screens/list/cocktail_expansion_panel_item.dart';
import 'package:cocktail_recipe_app/screens/list/cocktail_ext.dart';
import 'package:flutter/foundation.dart';

class CocktailListViewModel extends ChangeNotifier {
  CocktailListViewModel(this._cocktailListUseCase);

  final CocktailListUseCase _cocktailListUseCase;

  final List<CocktailExpansionPanelItem> _internalItemList = [];

  UnmodifiableListView<CocktailExpansionPanelItem> get items => UnmodifiableListView(_internalItemList);

  Future<void> onSearchCocktail(String searchKeyword) async {
    if (searchKeyword.isEmpty) {
      return;
    }

    var result = await _cocktailListUseCase.searchCocktails(searchKeyword);
    _internalItemList.addAll(result.cocktails.map((cocktail) => cocktail.toExpansionPanelItem()).toList());
    notifyListeners();
  }

  void onRemoveAll() {
    _internalItemList.clear();
    notifyListeners();
  }

  void onChangeDescriptionTextVisibility(int index, bool isExpanded) {
    if (index < 0) {
      throw Exception('index が 0 以下です');
    }

    _internalItemList[index].isExpanded = isExpanded;
    notifyListeners();
  }
}
