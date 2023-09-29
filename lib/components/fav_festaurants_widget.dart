import 'package:flutter/material.dart';
import 'package:food_offer/app_utils.dart';
import 'package:food_offer/models/favRestaurants.dart';

class FavRestaurants extends StatelessWidget {
  final FavRestaurantsModel restaurant;
  const FavRestaurants({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 360,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
             // decoration: BoxDecoration(color: Colors.lightGreen),
              // width: 100,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // ------------------ Image ------------------
                  Container(
                      height: 100,
                      width: 150,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(20),
                      //   color: colorGrey
                      // ),
                      child: Align(
                        child: Image.asset(
                          restaurant.image,
                          // height: 150,
                          //width: 150,
                          //fit: BoxFit.fitWidth,
                        ),
                      )),

                  Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ------------------ Name ------------------
                      // SizedBox(width: 10,),
                      Container(
                        padding: const EdgeInsets.only(top: 2.0, left: 6),
                        margin: const EdgeInsets.only(top: 12.0, left: 4),
                        width: 200,
                        height: 30,
                        alignment: Alignment.topLeft,
                        child: Text(
                          restaurant.name,
                          style: TextStyle(
                            fontFamily: primaryFont,
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // ------------------ Rationgs ------------------

                      SizedBox(
                        width: 200,
                        height: 50,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 25,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: restaurant.colors,
                            ),
                            //alignment: Alignment.,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 20.0,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  restaurant.ratings,
                                  style: TextStyle(
                                    fontFamily: primaryFont,
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),

          ),
        ),
        SizedBox(height: 8,),
        Divider(color: Colors.blueGrey,)
      ],
    );
  }
}
