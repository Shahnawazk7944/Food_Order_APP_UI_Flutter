import 'package:flutter/material.dart';

import '../app_utils.dart';
import '../components/showEmpty_widget.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "asset/icons/arrow-right.png",
              height: 35,
              width: 35,
              color: iconsColor,
            ),
            //replace with our own icon data.
          ),
        ),
        centerTitle: true,
        title: Text(
          "Notifications",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
              fontFamily: primaryFont),
        ),
        toolbarHeight: 50,
      ),
      body:const ShowEmpty_Widget(imgSource: 'asset/icons/silent.png',heading:"No any updates" ,),
    );
  }
}


