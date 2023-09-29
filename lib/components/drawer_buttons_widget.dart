import 'package:flutter/material.dart';
import 'package:food_offer/app_utils.dart';

class DrawerButtonsWidget extends StatelessWidget {
  final String img;
  final String name;
  const DrawerButtonsWidget({
    required this.name,
    required this.img,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Image.asset(
                img,
                color: iconsColor,
                height: 20.0,
                width: 20,
              ),
            ),
            Expanded(
                flex: 2,
                child: Text(
                  name,
                  style: TextStyle(
                    fontFamily: primaryFont,
                    fontSize: 16,
                    color: colorGrey,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}