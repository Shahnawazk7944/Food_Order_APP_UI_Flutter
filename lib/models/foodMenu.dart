import 'dart:ui';

class FoodMenu {
  String name;
  Color color;
  String image;
  List? products;
  List? cart;


  FoodMenu({required this.name, required this.color,
    required this.image, this.products, this.cart});

  String get _name => name;
  Color get _color =>color;
  String get _image => image;
  List? get _products => products;
  List? get _cart => cart;
}
