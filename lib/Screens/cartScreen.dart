import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untitled1/refactored_widgets/largeBottomButton.dart';

import '../services/api.dart';

class CartScreen extends StatefulWidget {
  final List<Recipe> cartRecipes;


  CartScreen({required this.cartRecipes});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                FontAwesomeIcons.xmark,
                size: 20,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'CART',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            Divider(),
            SizedBox(
              height: 15,
            ),
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 10),
                itemCount: widget.cartRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = widget.cartRecipes[index];
                  int quantity = 1; // Initialize quantity to 1 for each recipe

                  return Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            ListTile(
                              leading: Container(
                                height: 70,
                                width: 70,
                                child: Image.network(recipe.image ?? ''),

                              ),
                              trailing: Text(
                                '\$4.61',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                              title: Text(recipe.title ?? ''),
                              subtitle: Row(
                                children: [
                                  Expanded(
                                      child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (quantity > 1) {
                                          quantity--;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.minus,
                                      size: 15,
                                    ),
                                  )),
                                  Expanded(child: Text("1")),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          quantity++;
                                        });
                                      },
                                      icon:
                                          Icon(FontAwesomeIcons.plus, size: 15),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      LargeBottomButton(
                        text: "Check Out",
                        color: Colors.deepOrange,
                      )
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
