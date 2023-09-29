import 'dart:ui';

class FavRestaurantsModel {
  String image;
  String name;
  String ratings;
  Color colors;
  FavRestaurantsModel({required this.image, required this.name, required this.ratings,required this.colors});

  String get _image =>image;
  String get  _name => name;
  String get _ratitngs => ratings;
  Color get _color => colors;
}