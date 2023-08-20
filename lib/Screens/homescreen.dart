import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/Screens/favorite_screen.dart';
import 'package:untitled1/Screens/profileScreen.dart';
import 'package:untitled1/Screens/recipeView.dart';
import 'package:untitled1/Screens/recipe_tile.dart';
import 'package:untitled1/refactored_widgets/textfieldwithFilter.dart';
import 'package:untitled1/services/auth.dart';
import '../models/appUser.dart';
import '../models/recipeModels.dart';
import '../refactored_widgets/drawerListTile.dart';
import '../refactored_widgets/longCards.dart';
import '../services/api.dart';
import '../shared/refreshWidget.dart';
import 'Recommended_screen.dart';
import '../refactored_widgets/HomeScreenCard.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //text controller

  TextEditingController textEditingController = TextEditingController();
  String searchText = "";
  String? name;

  final AuthService _auth = AuthService(); // AuthService

  // bool isFavoriteIcon = true;  //toggle bool for favorite button

  // creating FxN for Favorite icon toggle
  void toggleFavoriteIcon(Recipe recipe) {
    setState(() {
      recipe.isFavorite = !recipe.isFavorite;
    });

    //conditions when the Favorite Icon is clicked
    recipe.isFavorite ? favoriteRecipes.add(recipe) : favoriteRecipes.remove(recipe);
  }

  void addToCart(Recipe recipe) {
    setState(() {
      if (!cartRecipes.contains(recipe)) {
        cartRecipes.add(recipe);
      }
    });
  }


  // pull to refresh functionality
  Future<void> refreshData() async {
    // Simulate a network request or any other data fetching operation
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      // Update your data here
      futureRecipes = apiService.fetchRecipes();
    });
  }

  final ApiService apiService = ApiService();
  late Future<List<Recipe>> futureRecipes;
  late Future<List<RecipeModel>> RecipesModel;
  List<RecipeModel> recipeModels = [];
  List<Recipe> d_recipeModels = [];
  List<Recipe> favoriteRecipes = []; // Stores favorites recipes here
  List<Recipe> cartRecipes = []; // Stores favorites recipes here


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
    final user = Provider.of<AppUser?>(context); // Assuming you are using a Provider for the user

    return Scaffold(
      body: RefreshPage(
        onRefresh: refreshData,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/food3.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () => openDrawer(context),
                        child: Container(
                          child: Icon(
                            FontAwesomeIcons.listUl,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }),
                    IconButton(
                      onPressed: () {
                        // Get.to(RecentlyViewedScreen());
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Danny",
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "What would you like to cook today?",
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextFieldWithFilter(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today's French Recipe",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap:(){Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecipeTiles()
                        ),
                      );},
                      child: Text(
                        "See All",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                FutureBuilder<List<Recipe>>(
                    future: futureRecipes,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          width: 400,
                          height: 250,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final recipe = snapshot.data![index];
                              return Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 200,
                                      height: 190,
                                      padding:EdgeInsets.only(right: 10),
                                            child: HomeScreenCard_1(
                                              onTapCard: (){
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
                                              image: recipe.image!,
                                              title: recipe.title!,
                                              text2: recipe.instructions??"",
                                              icon: FontAwesomeIcons.solidStar,
                                              origin: recipe.origin,
                                              addToCart: () {
                                                addToCart(recipe);
                                              },
                                            ),

                                    ),
                                  ),
                                ],
                              );

                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error loading recipes'));
                      } else {
                        return Center(child: CircularProgressIndicator(color: Colors.white70,)
                        );
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=> Get.to(RecommendedScreen(),),
                      child: Text(
                        "See All",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // for (int i = 0; i < 5; i++)
                Expanded(
                  child: FutureBuilder<List<Recipe>>(
                    future: futureRecipes,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(color: Colors.white70),
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
                        );
                      }
                    },
                  ),
                ),

              ],
            ),
          )),
        ),
      ),

      // SideDrawer
      drawer: Drawer(
        width: double.infinity,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            // height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/food2.jpeg"),
                fit: BoxFit.cover,
              ),
              color: Colors.grey.withOpacity(0.1),
            ),
            child: ListView(
              padding: EdgeInsets.fromLTRB(30, 60, 10, 0),
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/Guser.jpg"),
                        radius: 35,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user?.name ?? 'User Name' , // Display the user's name here
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap:() => Get.to(Profile()),
                            child: Text(
                              'View Profile',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.leftLong,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          // Close the drawer
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
//Line between head
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Divider(
                    thickness: 1.0, // You can adjust the thickness of the line
                    color: Colors
                        .grey[200], // You can change the color of the line
                  ),
                ),
                DrawerListTile(
                  icon: Icon(
                    FontAwesomeIcons.house,
                    color: Colors.white,
                  ),
                  title: "Home",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
                DrawerListTile(
                  icon: Icon(
                    FontAwesomeIcons.heart,
                    color: Colors.white,
                  ),
                  title: "Favorite",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavoriteScreen(
                        favoriteRecipes:favoriteRecipes
                      )),
                    );
                  },
                ),
                DrawerListTile(
                  icon: Icon(
                  FontAwesomeIcons.clockRotateLeft,
                  color: Colors.white,
                ),
                  title: "History",
                  function: ()=>null,
                ),
                DrawerListTile(
                  icon: Icon(
                  FontAwesomeIcons.handshakeAngle,
                  color: Colors.white,
                ),
                  title: "Help",
                  function: ()=>null,
                ),
                DrawerListTile(
                  icon: Icon(
                    FontAwesomeIcons.rightFromBracket,
                    color: Colors.white,
                  ),
                  title: "Log Out",
                  function: () async {
                      await _auth.signOut();
                    },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}





