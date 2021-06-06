class CocktailExpansionPanelItem {
  // コンストラクタを {} でくくると名前付き引数になる
  CocktailExpansionPanelItem({
    required this.cocktailId,
    required this.name,
    required this.contentText,
    // isExpanded の初期値は閉じている状態にしたいので false を設定してる
    this.isExpanded = false,
  });

  String cocktailId;
  String name;
  String contentText;
  bool isExpanded;
}
