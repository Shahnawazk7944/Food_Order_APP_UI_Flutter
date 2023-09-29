import 'dart:ui';

class FoodCategory {
  String name;
  String image;

  FoodCategory({required this.name, required this.image});

  String get _name => name;
  String get _image => image;
}
