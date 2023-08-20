import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreenCard_1 extends StatelessWidget {
  HomeScreenCard_1({
    required bool this.isFavoriteIcon,
    required this.onTapFavIcon,
    required this.image,
    required this.title,
    required this.text2,
    this.icon,
    this.time,
    this.origin,
    required this.onTapCard,
     this.addToCart, // Add this line


  });

  final bool? isFavoriteIcon;
  final VoidCallback? onTapFavIcon;
  final String image;
  final String title;
  final String text2;
  final IconData? icon;
  final double? time;
  final String? origin;
  final VoidCallback onTapCard;
  final VoidCallback? addToCart; // Add this parameter



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTapCard,
      child: Container(
        padding: EdgeInsets.all(5),
        height: 300,
        width: 155,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: onTapFavIcon,
                    child: Icon(
                      isFavoriteIcon!
                          ? FontAwesomeIcons.solidHeart
                          : FontAwesomeIcons.heart,
                      color: Colors.deepOrange,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    child: Image.network(image),
                  ),
                ],
              ),
            ),
            Text(
              title,
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.deepPurple),
            ),
            SizedBox(height: 10,),
            Text(
              text2,
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.white70),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.stopwatch,
                  size: 17,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  origin!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.deepOrange),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                for (int i = 1; i <= 5; i++)
                  Icon(
                    icon,
                    size: 16,
                    color: Colors.deepOrange,
                  )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: addToCart,
              icon: Icon(
                FontAwesomeIcons.cartPlus,
                size: 20,
              ),
            ),

          ],
        ),
      ),
    );
  }

}
