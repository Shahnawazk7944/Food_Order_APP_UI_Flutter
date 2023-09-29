import 'package:flutter/material.dart';
import 'package:food_offer/components/home_page_bottomMenu_widget.dart';
import 'package:food_offer/models/shop.dart';
import 'package:food_offer/screens/account.dart';
import 'package:food_offer/screens/cart.dart';
import 'package:food_offer/screens/favouritePage.dart';
import 'package:food_offer/screens/homePage.dart';
import 'package:food_offer/screens/login.dart';
import 'package:food_offer/screens/notification.dart';
import 'package:food_offer/screens/signUp.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Offer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const Favourites(),
      routes: {
        //"/": (context) => const HomePageBottomMenu(),
        "/": (context) => const signIn(),
        "/home": (context) => const HomePageBottomMenu(),
        "/favourite": (context) => const Favourites(),
        "/cart": (context) => const Cart(),
        "/notification": (context) => const Notifications(),
        "/account": (context) => const Account(),
      },
    );
  }
}
