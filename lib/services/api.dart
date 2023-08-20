import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled1/models/recipeModels.dart';

class ApiService {
  static const apiKey = "468a73f7b4e2486fba7338dcac1b068c";
  static const baseUrl = 'https://api.spoonacular.com/recipes/random?number=10';

  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(Uri.parse('$baseUrl&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> recipesData = jsonData['recipes'];
      List<Recipe> recipes = [];
      for (var item in recipesData) {
        Recipe recipe = Recipe.fromJson(item);
        recipes.add(recipe);
        print("${recipes.toString()}");
      }
      return recipes;

    } else {
      throw Exception('Failed to load recipes LOL -1');
    }
  }


  Future<List<RecipeModel>> fetchRecipe() async {
    final response = await http.get(Uri.parse('$baseUrl&apiKey=$apiKey'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> recipesData = jsonData['recipes'];
      List<RecipeModel> recipes = [];
      for (var item in recipesData) {
        RecipeModel recipe = RecipeModel.fromJson(item);
        recipes.add(recipe);
        print("${recipes.toString()}");
      }
      return recipes;

    } else {
      throw Exception('Failed to load recipe');
    }
  }
}


class Recipe {
  final String? title;
  final String? image;
  final String? instructions;
  final String? origin;
  bool isFavorite;
  double rating;
  final bool? cart;

  Recipe({ this.cart, this.rating = 0.0, required this.isFavorite, this.title,  this.image,  this.instructions,  this.origin});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(

      title: json['title'],
      image: json['image'],
      instructions: json['instructions'],
      origin: "Nigeria",
        isFavorite: false
    );
  }
}
