import 'package:flutter/material.dart';
import 'package:food_offer/app_utils.dart';
import 'package:food_offer/models/foodMenu.dart';

class FoodTile extends StatelessWidget {
  final FoodMenu food;
  final void Function()? onTap;
  FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Container(
             height: 150.0,
              width: 90,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6.0,
                  ),],
                  color: food.color, borderRadius: BorderRadius.circular(15)),

              padding: const EdgeInsets.only(
                left: 10.0,
              ),
             // margin: const EdgeInsets.only(top: 10.0,),

              child: Column(
                children: [
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(
                      food.name,
                      style: TextStyle(
                          fontSize: 15, fontFamily: primaryFont, color: Colors.black),
                    ),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    SizedBox(
                      height: 100,
                      width: 80,
                      child: Image.asset(
                        food.image,

                      ),
                    )
                  ])
                ,

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
