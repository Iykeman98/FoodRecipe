import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untitled1/shared/recipeBottomSheet.dart';

import '../refactored_widgets/largeBottomButton.dart';

class RecipeCardView extends StatefulWidget {

  final String? title;
  final String? text2;
  final String? image;

  RecipeCardView({
     this.title,
     this.text2,
     this.image,
  });
  @override
  _RecipeCardViewState createState() => _RecipeCardViewState();
}

class _RecipeCardViewState extends State<RecipeCardView> {

  final List<String> imagePaths = [
    'assets/img_2.png',
    'assets/frensh toast 2.png',
    'assets/img_2.png',
    'assets/img_1.png',
    'assets/img_1.png',
    'assets/img_2.png',
    'assets/frensh toast 2.png',
    'assets/img_1.png',
    'assets/frensh toast 2.png',
    'assets/img_1.png',
    // Add more image paths here as needed
  ];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor:Colors.black,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async {
                          Get.back();
                        },
                        color: Colors.white,
                        icon: Icon(
                          FontAwesomeIcons.leftLong,
                          size: 25,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                        },
                        color: Colors.white,
                        icon: Icon(
                          FontAwesomeIcons.solidBell,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title ?? "",
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                        color: Colors.blueAccent),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          widget.text2 ?? '',
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: (){},
                          icon: Icon(
                            FontAwesomeIcons.heart,
                            color: Colors.grey,),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Icon(
                          FontAwesomeIcons.star,
                          size: 16,
                          color: Colors.deepOrange,
                        )
                    ],
                  ),
                ],
              ),
            ), SizedBox(height: 10,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  FontAwesomeIcons.clock,
                                    color: Colors.white30,
                                  size: 18,
                                ),
                              ),
                              Text('10 mins', style: TextStyle(color: Colors.white30),),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  FontAwesomeIcons.bowlRice,
                                  color: Colors.grey,),
                              ),
                              Text('1 Serving', style: TextStyle(color: Colors.white30),),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 200,
                        height: 150,
                        child: Image.network(
                          widget.image ?? "",
                            fit: BoxFit.fill),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 80, // Set the height of the container
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (String imagePath in imagePaths)
                        Padding(
                          padding: EdgeInsets.all(8.0), // Add some spacing between images
                          child: Container(
                            width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Image.asset(imagePath)),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 70,),
                LargeBottomButton( color: Colors.orange, text: "Tutorial", function: ()=> _showModal(context)),
                LargeBottomButton( color: Colors.orange, text: "Recipe",  function: () {},),
              ],
            ),
          ),
        )

    );
  }

  void _showModal(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.grey[900],
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      showDragHandle: true,
      elevation: 10,
      context: context,
      builder: (BuildContext context) {
        return RecipeBottomSheet(
          title: widget.title,
          text2: widget.text2,
          image: widget.image,
        );
      },
    );
  }
}
