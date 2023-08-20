import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untitled1/refactored_widgets/Longcard2.dart';
import '../models/recipeModels.dart';
import '../refactored_widgets/textfieldwithFilter.dart';
import '../services/api.dart';


class RecentlyViewedScreen extends StatefulWidget {


  @override
  _RecentlyViewedScreenState createState() => _RecentlyViewedScreenState();
}

class _RecentlyViewedScreenState extends State<RecentlyViewedScreen> {


  TextEditingController textEditingController = TextEditingController();
  String searchText = "";

  bool isFavoriteIcon = true;  //toggle bool for favorite button

  // creating FxN for Favorite icon toggle
  void toggleFavoriteIcon() {
    setState(() {
      isFavoriteIcon = !isFavoriteIcon;
    });
  }


  final ApiService apiService = ApiService();
  late Future<List<Recipe>> futureRecipes;
  late Future<List<RecipeModel>> RecipesModel;
  List<RecipeModel> recipeModels = [];
  List<Recipe> d_recipeModels = [];

int maxCards  = 5;
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

                IconButton(
                  onPressed: () async {
                  },
                  color: Colors.white,
                  icon: Icon(
                    FontAwesomeIcons.listUl,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: ()  {
                  },
                  color: Colors.white,
                  icon: Icon(
                    FontAwesomeIcons.solidBell,
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
            Container(
              child: TextFieldWithFilter(),
            ),            SizedBox(
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

                    recipes = recipes.take(maxCards).toList();

                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      itemCount: recipes.length,
                      padding: EdgeInsets.only(bottom: 10),
                      itemBuilder: (context, index) {
                        Recipe recipe = recipes[index];
                        return Expanded(

                          child: Column(
                            children: [
                              GestureDetector(
                                child: LongCard22(
                                  text: recipe.title ?? "",
                                  image: recipe.image ?? "",
                                ),
                                onTap: () {
                                  // Do something when the card is tapped
                                },
                              ),
                              SizedBox(height: 16), // Add a separator
                            ],
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
