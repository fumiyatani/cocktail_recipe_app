import 'package:json_annotation/json_annotation.dart';

part 'Cocktails.g.dart';

@JsonSerializable()
class Cocktails {
  Cocktails(
      {required this.status, required this.totalPages, required this.currentPage, required this.cocktails});

  /// 正常時：0000, 現状使用するエラーは E001 (wordのフォーマットが不正)
  @JsonKey(name: 'status')
  final String status;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  @JsonKey(name: 'current_page')
  final int currentPage;

  @JsonKey(name: 'cocktails')
  final List<Cocktail> cocktails;

  factory Cocktails.fromJson(Map<String, dynamic> json) => _$CocktailsFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailsToJson(this);
}

@JsonSerializable()
class Cocktail {

  Cocktail(
      {required this.cocktailId,
      required this.cocktailName,
      required this.cocktailNameEnglish,
      required this.baseName,
      required this.techniqueName,
      required this.tasteName,
      required this.styleName,
      required this.alcohol,
      required this.topName,
      required this.glassName,
      required this.typeName,
      required this.cocktailDigest,
      required this.cocktailDesc,
      required this.recipeDesc,
      required this.recipes});

  @JsonKey(name: 'cocktail_id')
  final int cocktailId;

  @JsonKey(name: 'cocktail_name')
  final String cocktailName;

  @JsonKey(name: 'cocktail_name_english')
  final String cocktailNameEnglish;

  @JsonKey(name: 'base_name')
  final String baseName;

  @JsonKey(name: 'technique_name')
  final String techniqueName;

  @JsonKey(name: 'taste_name')
  final String tasteName;

  @JsonKey(name: 'style_name')
  final String styleName;

  @JsonKey(name: 'alcohol')
  final int alcohol;

  @JsonKey(name: 'top_name')
  final String topName;

  @JsonKey(name: 'glass_name')
  final String glassName;

  @JsonKey(name: 'type_name')
  final String typeName;

  @JsonKey(name: 'cocktail_digest')
  final String cocktailDigest;

  @JsonKey(name: 'cocktail_desc')
  final String cocktailDesc;

  @JsonKey(name: 'recipe_desc')
  final String recipeDesc;

  @JsonKey(name: 'recipes')
  final List<Recipe> recipes;

  factory Cocktail.fromJson(Map<String, dynamic> json) => _$CocktailFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailToJson(this);
}

@JsonSerializable()
class Recipe {
  Recipe({required this.ingredientId, required this.ingredientName, this.amount, this.unit});

  @JsonKey(name: 'ingredient_id')
  final int ingredientId;

  @JsonKey(name: 'ingredient_name')
  final String ingredientName;

  /// 適量 or FullUP の場合は null を返却する
  @JsonKey(name: 'amount')
  final String? amount;

  /// 単位として返却しうる値: ml,tsp.,dash,枚,個,適量,FullUP,glass
  @JsonKey(name: 'unit')
  final String? unit;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
