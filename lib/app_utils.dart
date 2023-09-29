import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Fonts
//String primaryFont = "Montserrat";
String primaryFont = 'OpenSans';

//Main Colors
const Color colorWhite = Colors.white;
const Color primaryColor = Color(0xfffece74);
const Color secondaryColor = Color(0xffff999a);
const Color thirdColor = Color.fromARGB(200, 255, 61, 61);
const Color colorGrey = Colors.blueGrey;
//Color iconsColor = Colors.blueGrey.shade900;
Color iconsColor = Colors.teal.shade800;

//FoodMenu Colors
const Color foodMenuColor1 = Color(0xffD6E2FD);
const Color foodMenuColor2 = Color(0xffFFFCB0);
const Color foodMenuColor3 = Color(0xffC0FFD2);
const Color foodMenuColor4 = Color(0xffFFC3C2);
const Color foodMenuColor5 = Color(0xffE6B0FF);
const Color foodMenuColor6 = Color(0xffFFD058);



showScaffold(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
