class CocktailExpansionPanelItem {
  // コンストラクタを {} でくくると名前付き引数になる
  CocktailExpansionPanelItem({
      // isExpanded の初期値は閉じている状態にしたいので false を設定してる
      this.isExpanded = false,
      required this.name,
      required this.contentText});

  bool isExpanded;
  String name;
  String contentText;
}
