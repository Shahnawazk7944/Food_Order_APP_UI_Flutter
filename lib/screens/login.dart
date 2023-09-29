import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_offer/app_utils.dart';
import 'package:food_offer/components/home_page_bottomMenu_widget.dart';
import 'package:food_offer/screens/homePage.dart';
import 'package:food_offer/screens/signUp.dart';
import 'package:food_offer/components//input_field_widget.dart';
import 'package:food_offer/components/primary_button.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: secondaryColor,
      body: Center(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 20.0,
                        height: 12.0,
                        decoration: const BoxDecoration(
                            color: colorWhite,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0))),
                      ),
                      const SizedBox(height: 1.5),
                      Container(
                        height: 3.0,
                        width: 20.0,
                        decoration: const BoxDecoration(
                            color: colorWhite,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0))),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "YUM",
                    style: TextStyle(
                      color: colorWhite,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: primaryFont,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              Text(
                "Welcome Back !",
                style: TextStyle(
                  color: colorWhite,
                  fontFamily: primaryFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Text(
                "Please enter your Sign In details below",
                style: TextStyle(
                  color: colorWhite,
                  fontFamily: primaryFont,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(
                height: 70.0,
              ),
              InputField(
                  controller: loginEmailController,
                  hintText: "Please enter your Email",
                  icon: Icons.email),
              const SizedBox(
                height: 25.0,
              ),
              InputField(
                controller: loginPasswordController,
                hintText: "Please enter your Password",
                icon: Icons.password,
                obscureText: true,
              ),
              const SizedBox(
                height: 70.0,
              ),
              PrimaryButton_widget(
                  onPressed: () {
                    if (isValidate()) {
                      print("Login Successful");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePageBottomMenu()));
                    }
                  },
                  text: "Sign In"),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: colorWhite,
                      fontFamily: primaryFont,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const registrationPage(),
                          ));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: colorWhite,
                        fontFamily: primaryFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
            )),
      ),
    );
  }

  bool isValidate() {
    if (loginEmailController.text.isEmpty) {
      showScaffold(context, "Please enter your Email");
      return false;
    }
    if (loginPasswordController.text.isEmpty) {
      showScaffold(context, "Please enter your Password");
      return false;
    }
    return true;
  }
}
