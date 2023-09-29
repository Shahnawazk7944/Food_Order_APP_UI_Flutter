import 'package:flutter/material.dart';
import 'package:food_offer/app_utils.dart';
import 'package:food_offer/components/fav_festaurants_widget.dart';
import 'package:food_offer/models/favRestaurants.dart';
import 'dart:math' as math;


const STAR_POINTS = 5;
class StarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;

    var path = Path();

    var radius = size.width / 2;
    var inner = radius / 2;
    var rotation = math.pi / 2 * 3;
    var step = math.pi / STAR_POINTS;

    path.lineTo(centerX, centerY - radius);

    for (var i = 0; i < STAR_POINTS; i++) {
      var x = centerX + math.cos(rotation) * radius;
      var y = centerY + math.sin(rotation) * radius;
      path.lineTo(x, y);
      rotation += step;

      x = centerX + math.cos(rotation) * inner;
      y = centerY + math.sin(rotation) * inner;
      path.lineTo(x, y);
      rotation += step;
    }

    path.lineTo(centerX, centerY - radius);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List favRestaurantsList = [
    FavRestaurantsModel(
        image: "asset/images/favRestaurants/res1.png",
        name: "Pizza Italiano",
        ratings: "3/5",
    colors: foodMenuColor1),
    FavRestaurantsModel(
        image: "asset/images/favRestaurants/res2.png",
        name: "Traditional Kebab",
        ratings: "5/5",
    colors: foodMenuColor2),
    FavRestaurantsModel(
        image: "asset/images/favRestaurants/res3.png",
        name: "Star Fish",
        ratings: "4/5",
    colors: foodMenuColor3),
    FavRestaurantsModel(
        image: "asset/images/favRestaurants/res4.png",
        name: "Boston Burgers",
        ratings: "2/5",
    colors: foodMenuColor1),
    FavRestaurantsModel(
        image: "asset/images/favRestaurants/res5.png",
        name: "Vegan Family",
        ratings: "4/5",
    colors: foodMenuColor2),
    FavRestaurantsModel(
        image: "asset/images/favRestaurants/res6.png",
        name: "The Flying Saucer",
        ratings: "5/5",
    colors: foodMenuColor3),
    FavRestaurantsModel(
        image: "asset/images/favRestaurants/res7.png",
        name: "City Forest Family",
        ratings: "3/5",
    colors: foodMenuColor1),
    FavRestaurantsModel(
        image: "asset/images/favRestaurants/res8.png",
        name: "Bayview Cafe",
        ratings: "4/5",
    colors: foodMenuColor2),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colorWhite,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    // ------------------ Restaurants Heading ------------------
                    Center(
                      child:  ClipPath(
                        clipper: StarClipper(),
                        child: Container(
                          color: secondaryColor,
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),

                    // ------------------ Restaurants Heading ------------------
                    Column(
                     // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("My",style: TextStyle(
                          fontSize: 13,
                          fontFamily: primaryFont,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text("Favourite",style: TextStyle(
                          fontSize: 13,
                          fontFamily: primaryFont,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text("Restaurants",style: TextStyle(
                          fontSize: 13,
                          fontFamily: primaryFont,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
             const SizedBox(height: 20,),

              SizedBox(
                height: 1200,
                 width: 380,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: favRestaurantsList.length,
                      //itemCount: 6,
                      // scrollDirection: Axis.vertical,
                      //shrinkWrap: true,
                      itemBuilder: (context, index) => FavRestaurants(restaurant: favRestaurantsList[index]),
                      )),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
