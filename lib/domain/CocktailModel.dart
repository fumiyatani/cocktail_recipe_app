import 'dart:collection';

import 'package:cocktail_recipe_app/ui/cocktail_expansion_panel_item.dart';
import 'package:flutter/foundation.dart';

class CocktailModel extends ChangeNotifier {

  List<CocktailExpansionPanelItem> _internalItemList = [];

  UnmodifiableListView<CocktailExpansionPanelItem>
    get items => UnmodifiableListView(_internalItemList);

  void onUpdateCocktailExpansionPanelItemList(List<CocktailExpansionPanelItem> list) {
    _internalItemList.addAll(list);
    notifyListeners();
  }

  void onRemoveAll() {
    _internalItemList.clear();
    notifyListeners();
  }

  void onChangeDescriptionTextVisibility(int index, isExpanded) {
    if (index < 0) {
      throw Exception("index が 0 以下です");
    }

    _internalItemList[index].isExpanded = isExpanded;
    notifyListeners();
  }
}