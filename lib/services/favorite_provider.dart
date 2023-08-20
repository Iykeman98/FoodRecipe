import 'package:flutter/material.dart';
import 'api.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Recipe> favoriteRecipes = [];

  void toggleFavorite(Recipe recipe) {
    if (favoriteRecipes.contains(recipe)) {
      favoriteRecipes.remove(recipe);
    } else {
      favoriteRecipes.add(recipe);
    }
    notifyListeners();
  }

  bool isFavorite(Recipe recipe) {
    return favoriteRecipes.contains(recipe);
  }
}
