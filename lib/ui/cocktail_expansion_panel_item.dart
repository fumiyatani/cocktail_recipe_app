class CocktailExpansionPanelItem {
  // コンストラクタを {} でくくると名前付き引数になる
  CocktailExpansionPanelItem({
      // isExpanded の初期値は閉じている状態にしたいので false を設定してる
      this.isExpanded = false,
      this.name,
      this.contentText})
      : assert(isExpanded != null),
        assert(name != null),
        assert(contentText != null);

  bool isExpanded;
  String name;
  String contentText;
}
