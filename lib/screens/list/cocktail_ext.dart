import 'package:cocktail_recipe_app/data/api/entity/cocktails.dart';

import 'cocktail_expansion_panel_item.dart';

extension CocktailExt on Cocktail {
  CocktailExpansionPanelItem toExpansionPanelItem() {
    return CocktailExpansionPanelItem(
      cocktailId: cocktailId.toString(),
      name: cocktailName,
      contentText: cocktailDesc,
    );
  }
}
