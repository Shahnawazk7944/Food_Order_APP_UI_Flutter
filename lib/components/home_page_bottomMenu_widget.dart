import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_offer/app_utils.dart';
import 'package:food_offer/screens/account.dart';
import 'package:food_offer/screens/cart.dart';
import 'package:food_offer/screens/favouritePage.dart';
import 'package:food_offer/screens/homePage.dart';
import 'package:food_offer/screens/notification.dart';

class HomePageBottomMenu extends StatefulWidget {

  const HomePageBottomMenu({super.key});

  @override
  State<HomePageBottomMenu> createState() => _HomePageBottomMenuState();
}

class _HomePageBottomMenuState extends State<HomePageBottomMenu> {
  int _page = 0;
  final bottomMenuItems = [
    Image.asset(
      "asset/icons/home.png",
      color: iconsColor,
      height: 20.0,
      width: 20,
    ),
    Image.asset(
      "asset/icons/heart.png",
      color: iconsColor,
      height: 20.0,
      width: 20,
    ),
    Image.asset(
      "asset/icons/shopping-cart.png",
      color: iconsColor,
      height: 20.0,
      width: 20,
    ),
    Image.asset(
      "asset/icons/bell.png",
      color: iconsColor,
      height: 20.0,
      width: 20,
    ),
    Image.asset(
      "asset/icons/portrait.png",
      color: iconsColor,
      height: 20.0,
      width: 20,
    ),
  ];
  List screens =const [
    HomePage(),
    Favourites(),
    Cart(),
    Notifications(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colorWhite,
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor:foodMenuColor4,
        backgroundColor: Colors.white,
        height: 60.0,
        color: Colors.grey.withOpacity(0.3),
        //color: const Color.fromARGB(255, 181, 181, 181),
        items: bottomMenuItems,
        // index: _page,
        onTap: (selectedPage) {
          setState(() {
            _page = selectedPage;
          });

          print(_page);
        },
      ),
      body:
       screens[_page],
    );
  }
}
