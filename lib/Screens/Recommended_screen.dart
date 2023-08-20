import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untitled1/Screens/recipeView.dart';
import '../models/recipeModels.dart';
import '../refactored_widgets/HomeScreenCard.dart';
import '../services/api.dart';


class RecommendedScreen extends StatefulWidget {


  @override
  _RecommendedScreenState createState() => _RecommendedScreenState();
}

class _RecommendedScreenState extends State<RecommendedScreen> {


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
                Text("Recommended", style:  TextStyle(color:Colors.white, fontSize: 25,fontWeight:FontWeight.bold ),),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 290,),
                  child: Container(
                    height: 50,
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          searchText = val;
                        });
                      },
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true, // Fill the background
                        fillColor: Colors.grey[200],
                        hintText: "Search Recipes",
                        hintStyle: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 15,
                        ),
                        suffixIcon: IconButton(
                          onPressed: ()=> textEditingController.text.isNotEmpty ? firstRecipeModel() : print('text is empty'),
                          icon: Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.grey[600],
                            size: 20,
                          ),
                        ),
                        suffixIconColor: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                      cursorColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 55,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    FontAwesomeIcons.filter,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),

            Expanded(
              child: FutureBuilder<List<Recipe>>(
                future: futureRecipes,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error fetching recipes"),
                    );
                  } else {
                    List<Recipe> recipes = snapshot.data ?? [];
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 15.0,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        Recipe recipe = recipes[index];
                        // int firstIndex = index * 2;
                        // int secondIndex = firstIndex + 1;
                        return GestureDetector(
                          // Customize your grid item here using the recipe data
                          child: Container(
                            width: 210,
                            height: 290,
                            padding:EdgeInsets.only(right: 10),
                            child: HomeScreenCard_1(
                              onTapCard:(){
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
                              image: recipe.image??"",
                              title: recipe.title??"",
                              text2: recipe.instructions??"",
                              icon: FontAwesomeIcons.solidStar,
                              origin: recipe.origin??"",
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
