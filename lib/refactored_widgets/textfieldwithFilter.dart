import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untitled1/Screens/cartScreen.dart';
import '../models/recipeModels.dart';
import '../services/api.dart';

class TextFieldWithFilter extends StatefulWidget {

  @override
  State<TextFieldWithFilter> createState() => _TextFieldWithFilterState();
}

class _TextFieldWithFilterState extends State<TextFieldWithFilter> {
  TextEditingController textEditingController = TextEditingController();

  String searchText = "";

 // AuthService
  final ApiService apiService = ApiService();

  late Future<List<Recipe>> futureRecipes;

  late Future<List<RecipeModel>> RecipesModel;

  List<RecipeModel> recipeModels = [];

  List<Recipe> d_recipeModels = [];

  void recipeModel() {
    apiService.fetchRecipe().then((recipeModels) {
      setState(() {
        this.recipeModels = recipeModels;
      });
    }).catchError((error) {
      print("Error fetching recipe models: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 250),
            child: Container(
              height: 50,
              child: TextField(
                onChanged: (val) {
                  // setState(() {
                  //   searchText = val;
                  // });
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
                    onPressed: ()=> textEditingController.text.isNotEmpty ? recipeModel() : print('text is empty'),
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
            width: 58,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: GestureDetector(
              onTap: (){
                Get.to(CartScreen(cartRecipes: [],));
              },
              child: Icon(
                FontAwesomeIcons.cartShopping,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
