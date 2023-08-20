import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untitled1/Screens/recipeView.dart';
import '../models/recipeModels.dart';
import '../refactored_widgets/longCards.dart';
import '../refactored_widgets/textfieldwithFilter.dart';
import '../services/api.dart';


class FavoriteScreen extends StatefulWidget {
  final List<Recipe> favoriteRecipes;

  FavoriteScreen({required this.favoriteRecipes});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {


  TextEditingController textEditingController = TextEditingController();
  String searchText = "";

  bool isFavoriteIcon = true;  //toggle bool for favorite button

  // creating FxN for Favorite icon toggle
  void toggleFavoriteIcon(Recipe recipe) {
    setState(() {
      recipe.isFavorite = !recipe.isFavorite;
    });
  }


  final ApiService apiService = ApiService();
  late Future<List<Recipe>> futureRecipes;
  late Future<List<RecipeModel>> RecipesModel;
  List<RecipeModel> recipeModels = [];
  List<Recipe> d_recipeModels = [];

  int maxCards = 5; // Maximum number of cards to display

  @override
  //initState for the API to fetch data when page builds
  void initState() {
    super.initState();
    futureRecipes = apiService.fetchRecipes();
  }

  void recipeModel() {
    apiService.fetchRecipe().then((recipeModels) {
      setState(() {
        this.recipeModels = recipeModels;
      });
    }).catchError((error) {
      print("Error fetching recipe models: $error");
    });
  }

  void firstRecipeModel() {
    apiService.fetchRecipes().then((firstRecipeModels) {
      setState(() {
        this.d_recipeModels = firstRecipeModels;
      });
    }).catchError((error) {
      print("Error fetching recipe models: $error");
    });
  }
  @override
  Widget build(BuildContext context) {
    // Recipe recipe = Recipe();

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Favorites", style:  TextStyle(color:Colors.white, fontSize: 25,fontWeight:FontWeight.bold ),),
                IconButton(
                  onPressed: ()  {
                    Get.back();
                  },
                  color: Colors.deepOrange,
                  icon: Icon(
                    FontAwesomeIcons.leftLong,
                    size: 25,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextFieldWithFilter(),
            ),            SizedBox(
              height: 50,
            ),

            widget.favoriteRecipes.isEmpty
                ? Center(
              child: Text(
                'No favorites added.',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
                :
            ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 10),
                      itemCount: widget.favoriteRecipes.length,
                      itemBuilder: (context, index) {
                        final recipe = widget.favoriteRecipes[index];
                        return Column(
                          children: [
                            LongCard(
                              onTaped: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RecipeCardView(
                                      title: recipe.title,
                                      text2: recipe.instructions ?? "",
                                      image: recipe.image,
                                    ),
                                  ),
                                );
                              },
                              isFavoriteIcon: recipe.isFavorite,
                              onTapFavIcon: () {
                                toggleFavoriteIcon(recipe);
                              },
                              text: recipe.title ?? "",
                              image: recipe.image ?? "",
                            ),

                            SizedBox(height: 16), // Add a separator
                          ],
                        );
                      },
                    )
          ],
        ),
      ),
    );
  }
}
