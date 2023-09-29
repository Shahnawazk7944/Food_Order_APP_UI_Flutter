import 'package:flutter/material.dart';
import 'package:food_offer/app_utils.dart';
import 'package:food_offer/screens/login.dart';
import 'package:intl/intl.dart';
import '../components/input_field_widget.dart';
import '../components/primary_button.dart';

class registrationPage extends StatefulWidget {
  const registrationPage({super.key});

  @override
  State<registrationPage> createState() => _registrationPageState();
}

class _registrationPageState extends State<registrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  String genderSelected = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: secondaryColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Food Offer",
            style: TextStyle(
              color: colorWhite,
              fontSize: 28,
              fontFamily: primaryFont,
              fontWeight: FontWeight.bold,
            ),
          )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Center(
            child: Text(
              "Eating became easier",
              style: TextStyle(
                color: colorWhite,
                fontSize: 28,
                fontFamily: primaryFont,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Center(
            child: Text(
              "Please enter your details",
              style: TextStyle(
                color: colorWhite,
                fontSize: 14,
                fontFamily: primaryFont,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          InputField(
            controller: nameController,
            icon: Icons.person,
            hintText: "Please enter your Name",
          ),
          const SizedBox(
            height: 25.0,
          ),
          InputField(
            controller: emailController,
            icon: Icons.email,
            hintText: "Please enter your Email",
          ),
          const SizedBox(
            height: 25.0,
          ),
          InputField(
            controller: passwordController,
            icon: Icons.password,
            hintText: "Please enter your Password",
            obscureText: true,
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 25),
            child: TextFormField(
              controller: dobController,
              style: TextStyle(color: colorWhite, fontFamily: primaryFont),
              textAlign: TextAlign.center,
              cursorColor: colorWhite,
              decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: const Icon(
                    Icons.calendar_month,
                    color: colorWhite,
                    size: 25.0,
                  ),
                  hintText: "Please enter your Birth Date",
                  hintStyle: TextStyle(
                    color: colorGrey,
                    fontFamily: primaryFont,
                    fontSize: 14.0,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: colorGrey))),
              onTap: () async {
                DateTime date = DateTime(1900);
                FocusScope.of(context).requestFocus(FocusNode());

                date = (await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100)))!;
                String dateFormatter = date.toIso8601String();
                DateTime dt = DateTime.parse(dateFormatter);
                var formatter = DateFormat('dd-MMMM-yyyy');
                dobController.text = formatter.format(dt);
              },
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "GENDER",
                  style: TextStyle(
                    color: colorWhite,
                    letterSpacing: 1,
                    fontFamily: primaryFont,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        activeColor: colorWhite,
                        title: Text(
                          "Male",
                          style: TextStyle(
                            fontFamily: primaryFont,
                            fontSize: 14.0,
                            color: colorWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        value: 'Male',
                        groupValue: genderSelected,
                        onChanged: (val) {
                          setState(() {
                            genderSelected = val.toString();
                          });
                        },
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        activeColor: colorWhite,
                        title: Text(
                          "Female",
                          style: TextStyle(
                            fontFamily: primaryFont,
                            fontSize: 14.0,
                            color: colorWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        value: 'Female',
                        groupValue: genderSelected,
                        onChanged: (val) {
                          setState(() {
                            genderSelected = val.toString();
                          });
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          PrimaryButton_widget(text: "Sign Up",
          onPressed: (){
            if(isValidate()){
              print("Sign Up Successful");
              Navigator.push(context, MaterialPageRoute(builder: (context) => const signIn()));
            }
          },
          ),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(
                  color: colorWhite,
                  fontFamily: primaryFont,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const signIn(),
                  ));
                },
                child: Text(
                  "Sign In",
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
      )),
    );
  }

  bool isValidate(){
    if(nameController.text.isEmpty){
      showScaffold(context, "Please enter your name");
      return false;
    }
    if(emailController.text.isEmpty){
      showScaffold(context, "Please enter your Email");
      return false;
    }
    if(passwordController.text.isEmpty){
      showScaffold(context, "Please enter your Password");
      return false;
    }
    if(dobController.text.isEmpty){
      showScaffold(context, "Please enter your Birth Date");
      return false;
    }

    return true;
  }
}
