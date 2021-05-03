import 'dart:collection';

import 'package:cocktail_recipe_app/ui/cocktail_expansion_panel_item.dart';
import 'package:flutter/foundation.dart';

class CocktailModel extends ChangeNotifier {

  List<CocktailExpansionPanelItem> _internalItemList = [];

  UnmodifiableListView<CocktailExpansionPanelItem>
    get items => UnmodifiableListView(_internalItemList);

  void updateCocktailExpansionPanelItemList(List<CocktailExpansionPanelItem> list) {

    _internalItemList.addAll(list);

    notifyListeners();
  }

  void removeCocktailExpansionPanelItemList() {
    _internalItemList.clear();

    notifyListeners();
  }
}