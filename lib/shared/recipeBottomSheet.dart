import 'package:flutter/material.dart';

class RecipeBottomSheet extends StatelessWidget {
  final String? title;
  final String? text2;
  final String? image;

  RecipeBottomSheet({
    this.title,
    this.text2,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.8,
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Container(
            height: 180,
            width: 300,
            child: Image.network(image ?? ""),
          ),
          SizedBox(height: 15),
          Center(
            child: Text(
              title ?? "",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                  color: Colors.blueAccent
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              text2 ?? "",
              style: TextStyle(

                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          // You can add more content here
        ],
      ),
    );
  }
}
