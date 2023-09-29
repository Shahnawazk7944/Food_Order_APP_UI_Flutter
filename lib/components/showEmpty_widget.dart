

import 'package:flutter/material.dart';

import '../app_utils.dart';

class ShowEmpty_Widget extends StatelessWidget {
  final String imgSource;
  final String heading;
  const ShowEmpty_Widget({
    required this.heading,
    required this.imgSource,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgSource,
            height: 150,
            width: 150,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            heading,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
                fontFamily: primaryFont),
          ),
        ],
      ),
    );
  }
}