import 'package:flutter/material.dart';
import '../app_utils.dart';

class PrimaryButton_widget extends StatelessWidget {
  const PrimaryButton_widget({
    required this.onPressed,
    required this.text,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 5.0,
        child: Container(
          decoration: BoxDecoration(
            color: colorGrey,
            borderRadius: BorderRadius.circular(30),
          ),
          constraints: const BoxConstraints(maxHeight: 60),
          alignment: Alignment.center,
          child: Text(text,
            style: TextStyle(
              color: colorWhite,
              fontSize: 16,
              fontFamily: primaryFont,
            ),
          ),
        ),
      ),
    );
  }
}