// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cocktails _$CocktailsFromJson(Map<String, dynamic> json) {
  return Cocktails(
    status: json['status'] as String,
    totalPages: json['total_pages'] as int,
    currentPage: json['current_page'] as int,
    cocktails: (json['cocktails'] as List).map((e) => Cocktail.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

Map<String, dynamic> _$CocktailsToJson(Cocktails instance) => <String, dynamic>{
      'status': instance.status,
      'total_pages': instance.totalPages,
      'current_page': instance.currentPage,
      'cocktails': instance.cocktails,
    };

Cocktail _$CocktailFromJson(Map<String, dynamic> json) {
  return Cocktail(
    cocktailId: json['cocktail_id'] as int,
    cocktailName: json['cocktail_name'] as String,
    cocktailNameEnglish: json['cocktail_name_english'] as String,
    baseName: json['base_name'] as String,
    techniqueName: json['technique_name'] as String,
    tasteName: json['taste_name'] as String,
    styleName: json['style_name'] as String,
    alcohol: json['alcohol'] as int,
    topName: json['top_name'] as String,
    glassName: json['glass_name'] as String,
    typeName: json['type_name'] as String,
    cocktailDigest: json['cocktail_digest'] as String,
    cocktailDesc: json['cocktail_desc'] as String,
    recipeDesc: json['recipe_desc'] as String,
    recipes: (json['recipes'] as List).map((e) => Recipe.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

Map<String, dynamic> _$CocktailToJson(Cocktail instance) => <String, dynamic>{
      'cocktail_id': instance.cocktailId,
      'cocktail_name': instance.cocktailName,
      'cocktail_name_english': instance.cocktailNameEnglish,
      'base_name': instance.baseName,
      'technique_name': instance.techniqueName,
      'taste_name': instance.tasteName,
      'style_name': instance.styleName,
      'alcohol': instance.alcohol,
      'top_name': instance.topName,
      'glass_name': instance.glassName,
      'type_name': instance.typeName,
      'cocktail_digest': instance.cocktailDigest,
      'cocktail_desc': instance.cocktailDesc,
      'recipe_desc': instance.recipeDesc,
      'recipes': instance.recipes,
    };

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe(
    ingredientId: json['ingredient_id'] as int,
    ingredientName: json['ingredient_name'] as String,
    amount: json['amount'] as String,
    unit: json['unit'] as String,
  );
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'ingredient_id': instance.ingredientId,
      'ingredient_name': instance.ingredientName,
      'amount': instance.amount,
      'unit': instance.unit,
    };
