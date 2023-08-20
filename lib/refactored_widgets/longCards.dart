import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LongCard extends StatelessWidget {
  final String? image;
  final String? text;
  final VoidCallback onTaped;
  final bool? isFavoriteIcon;
  final VoidCallback? onTapFavIcon;



  LongCard({
    required  this.onTapFavIcon,
    required bool this.isFavoriteIcon,
   required this.onTaped,
     this.text,
     this.image
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaped,
      child: Container(
        padding: EdgeInsets.all(3),
        height: 65,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 90,
                width: 90,
                child: Image.network(image!),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    maxLines: 1,
                    text!,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Icon(
                          FontAwesomeIcons.solidStar,
                          size: 12,
                          color: Colors.deepOrange,
                        )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                    ],
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        FontAwesomeIcons.stopwatch,
                        size: 18,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "10:08",
                        style: TextStyle(
                            color: Colors.deepOrange, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}