import 'package:flutter/material.dart';
import 'package:food_offer/app_utils.dart';
import 'package:food_offer/models/foodCategory.dart';
import 'package:food_offer/models/foodMenu.dart';

class FoodCategoryTile extends StatelessWidget {
  final FoodCategory food;
  const FoodCategoryTile({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70.0,
          width: 70,
          // margin: const EdgeInsets.only(top: 10.0,),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8.0,
                            ),
                          ],
                          color: colorWhite,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              food.image,
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
              SizedBox(height: 2,),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Flexible(
                  child: Text(
                    food.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        fontFamily: primaryFont,

                        color: Colors.black),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
