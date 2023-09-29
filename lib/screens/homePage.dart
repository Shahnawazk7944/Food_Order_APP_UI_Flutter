import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_offer/app_utils.dart';
import 'package:food_offer/components/food_menu_widget.dart';
import 'package:food_offer/models/foodCategory.dart';
import 'package:food_offer/models/foodCategory.dart';
import 'package:food_offer/models/foodMenu.dart';
import 'package:food_offer/screens/account.dart';
import 'package:food_offer/screens/productDetails.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/food_category_widget.dart';
import '../models/shop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  // --------------- Food Category Items ---------------
  List foodCategoryItems = [
    FoodCategory(name: "Vegans", image: "asset/images/foodCateg/Pure.png"),
    FoodCategory(name: "Ice Cremes", image: "asset/images/foodCateg/Ice.png"),
    FoodCategory(
        name: "Shawarmas", image: "asset/images/foodCateg/Shawarma.png"),
    FoodCategory(
        name: "Desserts", image: "asset/images/foodCateg/Desserts.png"),
    FoodCategory(name: "Noodles", image: "asset/images/foodCateg/Noodles.png"),
    FoodCategory(
        name: "South Indian", image: "asset/images/foodCateg/South.png"),
    FoodCategory(name: "Shakes", image: "asset/images/foodCateg/Shakes.png"),
    FoodCategory(name: "Salads", image: "asset/images/foodCateg/Salad.png"),
  ];


  // --------------- Bottom Menu Buttons ---------------
  final bottomMenuItems = [
    Image.asset(
      "asset/icons/home.png",
      height: 20.0,
      width: 20,
    ),
    Image.asset(
      "asset/icons/heart.png",
      height: 20.0,
      width: 20,
    ),
    Image.asset(
      "asset/icons/shopping-cart.png",
      height: 20.0,
      width: 20,
    ),
    Image.asset(
      "asset/icons/bell.png",
      height: 20.0,
      width: 20,
    ),
    Image.asset(
      "asset/icons/portrait.png",
      height: 20.0,
      width: 20,
    ),
  ];



  // --------------- Navigate to Product page ---------------
  void navigateToProductPage(int index) {
    // just try
    final shop = context.read<Shop>();
    final foodItems = shop.foodMenu;
    //
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetails(
                  product: foodItems[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    //Accessed the products throw global
    final shop = context.read<Shop>();
    final foodItems = shop.foodMenu;

    return Scaffold(
      drawer: const Drawer(
        child: SingleChildScrollView(
          child: Account(),
        ),
      ),
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: colorWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //App Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "F",
                      style: GoogleFonts.lobsterTwo(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        fontSize: 28.0,
                        color: secondaryColor,
                      ),
                    ),
                    Text(
                      "ood O",
                      style: GoogleFonts.lobsterTwo(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          fontSize: 28.0),
                    ),
                    Text(
                      "ff",
                      style: GoogleFonts.lobsterTwo(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        fontSize: 28.0,
                        color: secondaryColor,
                      ),
                    ),
                    Text(
                      "er",
                      style: GoogleFonts.lobsterTwo(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          fontSize: 28.0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),

                //Menu Bar and Account
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if(_scaffoldKey.currentState!.isDrawerOpen){
                            _scaffoldKey.currentState!.openEndDrawer();
                          }else{
                            _scaffoldKey.currentState!.openDrawer();
                          }
                        },
                        child: Image.asset(
                          "asset/icons/menu-burger.png",
                          height: 30.0,
                          width: 30.0,
                          color: iconsColor,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'asset/icons/location.png',
                            height: 15.0,
                            width: 15.0,
                            color: secondaryColor,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Mumbai, India",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                                fontFamily: primaryFont,
                                color: Colors.black),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: secondaryColor,
                          )
                        ],
                      ),
                      Image.asset(
                        'asset/icons/man.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),

                //Second Heading
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delicious Food?",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
                            fontFamily: primaryFont,
                            color: Colors.black),
                      ),
                      Text(
                        "Go Ahead...",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
                            fontFamily: primaryFont,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),

                //---------------Search Bar--------------
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: searchController,
                    style: TextStyle(
                      color: colorGrey,
                      fontFamily: primaryFont,
                    ),
                    // textAlign: TextAlign.center,
                    cursorColor: colorWhite,
                    decoration: InputDecoration(
                      iconColor: Colors.black87,
                      isDense: true,
                      filled: true,
                      fillColor: Color.fromARGB(255, 232, 232, 232),
                      focusColor: colorGrey,
                      prefixIcon: Image.asset(
                        "asset/icons/search.png",
                        height: 10.0,
                        width: 10.0,
                        color: iconsColor,
                      ),
                      suffixIcon: Icon(
                        Icons.cake_rounded,
                        size: 40.0,
                        color: iconsColor,
                      ),
                      hintText: " Search for you favourite food",
                      hintStyle: TextStyle(
                          color: colorGrey,
                          fontSize: 12.0,
                          fontFamily: primaryFont),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 232, 232, 232)),
                          borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 232, 232, 232)),
                          borderRadius: BorderRadius.circular(30)),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                ),

                //-----------Discount Heading ------------
                const SizedBox(
                  height: 10.0,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: 30.0,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: thirdColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "30% Offer on your first purchase",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300,
                            fontFamily: primaryFont,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ]),

                //-----------Foood Menu ------------

                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  height: 320,
                  width: 360,
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 0,
                        mainAxisExtent: 160,
                      ),
                      itemCount: foodItems.length,
                      //itemCount: 6,
                      // scrollDirection: Axis.vertical,
                      //shrinkWrap: true,
                      itemBuilder: (context, index) => FoodTile(
                            food: foodItems[index],
                            onTap: () => navigateToProductPage(index),
                          )),
                ),

                //-----------SEE More-------------

                SizedBox(
                  height: 2,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "See More...",
                        style: TextStyle(
                          fontFamily: primaryFont,
                          color: Colors.blueAccent,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                          width: 100,
                          child: Divider(
                            height: 2,
                            color: Colors.blueAccent,
                          ))
                    ],
                  ),
                ),

                // -----------Food Category ------------
                const SizedBox(
                  height: 2.0,
                ),
                SizedBox(
                  height: 380,
                  width: 380,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 0,
                          mainAxisExtent: 80,
                        ),
                        itemCount: foodCategoryItems.length,
                        //itemCount: 6,
                        // scrollDirection: Axis.vertical,
                        //shrinkWrap: true,
                        itemBuilder: (context, index) => FoodCategoryTile(
                              food: foodCategoryItems[index],
                            )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
