import 'package:flutter/material.dart';
import 'package:food_offer/app_utils.dart';
import 'package:food_offer/components/drawer_buttons_widget.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        // ------------------ Heading ------------------
        Container(
          color: secondaryColor,
          height: 250,
          width: double.infinity,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 90,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("asset/icons/man.png"),
                    )),
              ),
              Text(
                "Developer Mode",
                style: TextStyle(
                  fontFamily: primaryFont,
                  fontSize: 20,
                  color: colorWhite,
                ),
              ),
              Text(
                "Developer@dev.com",
                style: TextStyle(
                  fontFamily: primaryFont,
                  fontSize: 14,
                  color: colorGrey,
                ),
              ),
            ],
          ),
        ),

        // ------------------ Drawer Actions List ------------------
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DrawerButtonsWidget(name: "Home", img: "asset/icons/home.png"),
            DrawerButtonsWidget(name: "Favourite", img: "asset/icons/heart.png"),
            DrawerButtonsWidget(name: "Cart", img: "asset/icons/shopping-cart.png"),
            DrawerButtonsWidget(name: "Notifications", img: "asset/icons/bell.png"),
            DrawerButtonsWidget(name: "Account", img: "asset/icons/portrait.png"),
          ],
        )
      ],
    );
  }
}
