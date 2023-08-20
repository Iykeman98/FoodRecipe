import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {

  final String title;
  final String text2;
  final String image;

  Profile({
    required this.title,
    required this.text2,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              child: IconButton(
                onPressed: () async {
                  Get.back();
                },
                color: Colors.deepOrange,
                icon: Icon(
                  FontAwesomeIcons.leftLong,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: 300,
              child: Image.asset(image),
            ),
            SizedBox(height: 10,),
            Text(
              title, // Display the title
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              text2, // Display the detailed text
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
