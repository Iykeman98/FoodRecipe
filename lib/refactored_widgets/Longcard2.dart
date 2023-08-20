import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LongCard2 extends StatelessWidget {
  final String? image;
  final String? text;

  LongCard2({
    required this.text,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 100,
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                height: 80,
                width: 90,
                child: Image.network(image!),
                decoration: BoxDecoration(
                ),
              ),
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
                      fontSize: 5,
                      fontWeight: FontWeight.w500),
                ), Text(
                  maxLines: 1,
                  text!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Icon(
                            FontAwesomeIcons.solidStar,
                            size: 10,
                            color: Colors.deepOrange,
                          )
                      ],
                    ),
                    Text(
                      "120 Calories",
                      style: TextStyle(
                          color: Colors.deepOrange, fontSize: 11),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){},
                          icon: Icon(
                            size: 5,
                            FontAwesomeIcons.bowlRice,
                            color: Colors.grey,),
                        ),
                        Text('1 Serving', style: TextStyle(fontSize: 5, color: Colors.white30),),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){},
                          icon: Icon(
                            size: 5,
                            FontAwesomeIcons.bowlRice,
                            color: Colors.grey,),
                        ),
                        Text('10 mins', style: TextStyle(fontSize: 5, color: Colors.white30),),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      FontAwesomeIcons.heart,
                      color: Colors.deepOrange,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class LongCard22 extends StatelessWidget {
  final String? image;
  final String? text;

  LongCard22({
    required this.text,
    required this.image
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
     child: Padding(
       padding: const EdgeInsets.all(6.0),
       child: Row(
         children: [
           Expanded(
             child: ClipRRect(
               borderRadius: BorderRadius.circular(18),
               child: Container(
                 height: 70,
                 width: 70,
                 child: Image.network(image!),
                 decoration: BoxDecoration(
                 ),
               ),
             ),
           ),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Expanded(
                   child: Text(
                     maxLines: 1,
                     text!,
                     style: TextStyle(
                         color: Colors.blueGrey,
                         fontSize: 8,
                         fontWeight: FontWeight.w500),
                   ),
                 ), 
                 Expanded(
                   child: Text(
                     maxLines: 1,
                     text!,
                     style: TextStyle(
                         color: Colors.white,
                         fontSize: 12,
                         fontWeight: FontWeight.w500),
                   ),
                 ),
                 Expanded(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
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
                       Text(
                         "120 Calories",
                         style: TextStyle(
                             color: Colors.deepOrange, fontSize: 12),
                       ),
                     ],
                   ),
                 ),
                 Expanded(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           IconButton(
                             onPressed: (){},
                             icon: Icon(
                               size: 12,
                               FontAwesomeIcons.bowlRice,
                               color: Colors.grey,),
                           ),
                           Text('1 Serving', style: TextStyle(fontSize: 8, color: Colors.white30),),
                         ],
                       ),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           IconButton(
                             onPressed: (){},
                             icon: Icon(
                               size: 12,
                               FontAwesomeIcons.bowlRice,
                               color: Colors.grey,),
                           ),
                           Text('10 mins', style: TextStyle(fontSize: 8, color: Colors.white30),),
                         ],
                       ),
                     ],
                   ),
                 )
               ],
             ),
           ),
           Container(
             color: Colors.blueGrey,
             width: 50,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Icon(
                       size: 18,
                       FontAwesomeIcons.heart,
                       color: Colors.deepOrange,
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
