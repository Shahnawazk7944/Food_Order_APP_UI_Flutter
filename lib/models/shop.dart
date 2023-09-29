import 'package:flutter/material.dart';

import '../app_utils.dart';
import 'foodMenu.dart';

class Shop extends ChangeNotifier{
final List<FoodMenu> _foodItems = [
  FoodMenu(
      name: "Burger",
      color: foodMenuColor1,
      image: "asset/images/foodMenu/Burger.png",
      products: [
        {
          'name': 'Piri Piri McSpicy Chicken Burger',
          'desc': 'Indulge in a flavor-filled adventure with the irresistible Piri Piri McSpicy Chicken burger! Spicy chicken patty, Piri Piri creamy sauce and crunchy lettuce come together, leaving you craving for more!',
          'price': 4.51,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695300966/FoodAppImages/products/burger/wpraltz9k0hxmuv3m6ni.png',
        },
        {
          'name': 'McSpicy Premium Chicken Burger',
          'desc': 'A deliciously filling meal of McSpicy Premium Chicken Burger + Fries (M) + Drink of your choice',
          'price': 6.63,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695300968/FoodAppImages/products/burger/lej3umaxskbukkbkuzbk.png',
        },
        {
          'name': 'McSpicy Chicken Burger',
          'desc': 'Tender and juicy chicken patty coated in spicy, crispy batter topped with a creamy sauce and crispy shredded lettuce will have you craving for more.',
          'price': 3.28,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695300968/FoodAppImages/products/burger/rlehvz3jogzpse2ladc4.png',
        },
        {
          'name': 'McSaver Chicken Maharaja Burger',
          'desc': 'Enjoy a double decker Chicken Maharaja Mac + Fries (M) + Drink of your Choice . Order now to experience a customizable, delicious meal.',
          'price': 8.68,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695300965/FoodAppImages/products/burger/exkvtocc0s09py1oavsc.png',
        },
        {
          'name': 'McSpicy Paneer Burger',
          'desc': 'Rich and filling cottage cheese patty coated in spicy, crispy batter topped with a creamy sauce and crispy shredded lettuce will have you craving for more.',
          'price': 2.90,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695300969/FoodAppImages/products/burger/l0wjqe36ci5idobj5p7a.png',
        },
      ]),
  FoodMenu(
      name: "Pizza",
      color: foodMenuColor2,
      image: "asset/images/foodMenu/Pizza.png",
      products: [
        {
          'name': 'Chicago Deep Dish Pizza',
          'desc': 'A Classic Chicago Deep Dish Pizza Prepared with our signature pizza base & our classic house red pizza sauce, roast pepper, jalapenos & sun-dried tomato.',
          'price': 12.44,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301054/FoodAppImages/products/pizza/joddjjpccz7ipgzcflrt.png',
        },
        {
          'name': 'Margherita Pizza',
          'desc': 'An Authentic Italian Naples Pizza Prepared with our signature pizza base & our classic house red pizza sauce with tomatoes, mozzarella, fresh basil & extra virgin olive oil.',
          'price': 6.28,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301057/FoodAppImages/products/pizza/li1zorr163o6hoobsjah.png',
        },
        {
          'name': 'Mushroom With Truffle Oil Pizza',
          'desc': 'An Authentic Italian Naples Pizza Prepared with our signature pizza base & our classic house white pizza sauce with Button Mushroom, Shitake Mushroom, Goatt Cheese, Truffle Oil & Fresh Parsley.',
          'price': 5.21,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301063/FoodAppImages/products/pizza/xikshb47ewiseo76nagw.png',
        },
        {
          'name': 'Double Pepperoni Pizza',
          'desc': 'A Classic New York Style Double Pepperoni Pizza Prepared with our signature pizza base & our classic house red pizza sauce with Mozzarella & Bocconcini.',
          'price': 11.48,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301052/FoodAppImages/products/pizza/iv8hsr0xceytsseh2irb.png',
        },
        {
          'name': 'All Meat Pizza',
          'desc': 'An Authentic Italian Naples Pizza Prepared with our signature pizza base & our classic house red pizza sauce with Mozzarella, Peri Peri Chicken Sausage, Pepperoni, Bacon, Smoke Chicken.',
          'price': 8.21,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301065/FoodAppImages/products/pizza/dugcgm75fp6ooprdvzzs.png',
        },
      ]),
  FoodMenu(
      name: "Pasta",
      color: foodMenuColor3,
      image: "asset/images/foodMenu/Pasta.png",
      products: [
        {
          'name': 'Arrabiata Sauce With Zucchini, Mushroom And Cherry Tomato',
          'desc': 'Spicy Red Sauce Exotic Pasta served with a piece of garlic bread along with Zucchini, Mushroom & Cherry Tomato)',
          'price': 6.14,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695300979/FoodAppImages/products/pasta/lkvbicxss7bs97vtkmv9.png',
        },
        {
          'name': 'Cheesy Pesto Risotto With Olives & Cherry Tomato',
          'desc': 'Basil Pesto Risotto with Olives & Cherry Tomato',
          'price': 8.08,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301029/FoodAppImages/products/pasta/bacbks5julqd5ii3fnbk.png',
        },
        {
          'name': 'Baked Mac & Cheese Pasta',
          'desc': 'Baked Macaroni in cheesy white sauce Pasta',
          'price': 5.12,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301024/FoodAppImages/products/pasta/hhxlbjhxfmnvkwdyssrk.png',
        },
        {
          'name': 'Creamy Paprika Sauce With Olives',
          'desc': 'Spicy White pasta with garlic bread',
          'price': 6.12,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301032/FoodAppImages/products/pasta/ocbwj7egtn9do2z6aeec.png',
        },
        {
          'name': 'Cajun Spiced Pasta With Zucchini And Bell Pepper',
          'desc': 'Exotic Pasta in Creamy Spicy Cajun Sauce',
          'price': 5.11,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301009/FoodAppImages/products/pasta/jji01qym56qki914mdxu.png',
        },
      ]),
  FoodMenu(
      name: "Cakes",
      color: foodMenuColor4,
      image: "asset/images/foodMenu/Cakes.png",
      products: [
        {
          'name': 'Red Velvet Cake',
          'desc': 'Red velvet sponge layered with cream cheese frosting',
          'price': 14.25,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695300969/FoodAppImages/products/cakes/vay5enhl56kjykf2fj9h.png',
        },
        {
          'name': 'Nutella Cake',
          'desc': 'This Nutella Cake is an incredible combination of deliciously moist chocolate cake and luscious Nutella cream. It\'s a decadent dessert that you must try!',
          'price': 16.78,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301006/FoodAppImages/products/cakes/m01dr6reqbjyjd9zdopy.png',
        },
        {
          'name': 'Red Velvet Cheesecake',
          'desc': 'This popular cheese is a beloved classic that you can never go wrong. A contemporary, geometric masterpiece, our Red Velvet Cake is nothing short of a piece of art.',
          'price': 11.12,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695300970/FoodAppImages/products/cakes/u4h0sbuhqujpjlopfh2z.png',
        },
        {
          'name': 'Rasmalai Cake',
          'desc': 'Our most popular fusion cake has layers filled with Rasmali and pistachios, along with condensed milk to give it the perfect festive flavour.',
          'price': 14.55,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301005/FoodAppImages/products/cakes/vvf9xitukjmvhkuxeenl.png',
        },
        {
          'name': 'Truffle Torte Rich Truffle Cake',
          'desc': 'Our best seller after the dutch truffle, the rich truffle is a moist chocolate cake with Chocolate Ganache, combined with Nought and mild coffee.',
          'price': 15.36,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695300968/FoodAppImages/products/cakes/kgehk3yvpnz68hzcdjpb.png',
        },
      ]),
  FoodMenu(
      name: "Pastry",
      color: foodMenuColor5,
      image: "asset/images/foodMenu/Pastry.png",
      products: [
        {
          'name': 'Brownie Temptation Pastry',
          'desc': 'Delightful and delicious chocolate sponge with crushed brownie bites glazed with chocolate sauce a must try for brownie lovers.',
          'price': 2.11,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301035/FoodAppImages/products/pastry/ouyjkyxng6kezniffznw.png',
        },
        {
          'name': 'Rich Red Velvet Pastry',
          'desc': 'Rich and moist Red Velvet cake layered with fresh cream cheese makes our Red Velvet pastry difficult to share. Youll think twice too.',
          'price': 1.80,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301046/FoodAppImages/products/pastry/kgv733fndpaenerpparw.png',
        },
        {
          'name': 'Eggless Vanilla & Blueberry Cupcake',
          'desc': 'Moist & fluffy vanilla cupcake filled with blueberry jam & topped with blueberry butter cream frosting.',
          'price': 1.40,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301037/FoodAppImages/products/pastry/gxycjm7jbghmwoolyk2m.png',
        },
        {
          'name': 'Chocolate Orange Mousse Pastry',
          'desc': 'Creamy dark chocolate mousse & our house-made fresh orange marmalade layered on moist dark chocolate sponge.',
          'price': 2.00,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301073/FoodAppImages/products/pastry/yl5yhfucwrs2oopjydct.png',
        },
        {
          'name': 'Fresh Fruit & Cream Pastry',
          'desc': 'Layers of vanilla sponge, fluffy whipped cream, juicy fresh fruits & fruit compote, topped with seasonal fresh fruits.',
          'price': 3.10,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301032/FoodAppImages/products/pastry/uxjos2nffkcuxsa0wgp0.png',
        },
      ]),
  FoodMenu(
      name: "Kebabs",
      color: foodMenuColor6,
      image: "asset/images/foodMenu/Kebabs.png",
      products: [
        {
          'name': 'Mutton Seekh Chelo Kebab',
          'desc': 'Minced mutton kebabs, ground with classic Indian spices and green chillies, grilled on an open fire sigdi and topped with a creamy buttered.',
          'price': 5.49,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301035/FoodAppImages/products/kebabs/i4xd65zvedduwdhlcp0g.png',
        },
        {
          'name': 'Gosht-E-Galouti Kebab',
          'desc': 'A melt-in-mouth culinary delicacy it can take the most enigmatic feasts a notch above.',
          'price': 4.90,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301028/FoodAppImages/products/kebabs/jqr4gua8gihrab9mnk03.png',
        },
        {
          'name': 'Murgh Seekh Kebab',
          'desc': 'One of the most revered kebab delicacies, this culinary marvel is crafted with minced chicken that is elegantly spiced with royal spices and is served with a refreshing mint dip.',
          'price': 5.80,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301014/FoodAppImages/products/kebabs/bfhwmvnmk3puabnmdqir.png',
        },
        {
          'name': 'Paneer Hazarvi Tikka',
          'desc': 'A blend of assorted mushrooms, paneer and potato, all enriched with indulgent truffle oil.',
          'price': 4.30,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301028/FoodAppImages/products/kebabs/zpmwehcvsuyzdhprk54p.png',
        },
        {
          'name': 'Hara Bhara Kebab',
          'desc': 'Savour the goodness of finely minced potatoes, garden-fresh spinach and green peas, gently spiced with shahi masalas and shallow-fried to perfection.',
          'price': 3.12,
          'image': 'https://res.cloudinary.com/ddtf7ekwt/image/upload/v1695301015/FoodAppImages/products/kebabs/omjpdpdsdudafcvhimuo.png',
        },
      ]),
];

//Users Cart
// List <FoodMenu> _cart =[];
List _cart =[];
//Getter Methods
List<FoodMenu> get foodMenu => _foodItems;
// List<FoodMenu> get cart => _cart;
List get cart => _cart;

//Add to cart
  void addToCart(String productName, String productImage,double productPrice, int quantity){
    _cart.add([productName,productImage,productPrice,quantity]);
    // for (int i=0; i<quantity; i++){
    //
    // }
    notifyListeners();
  }

//Remove from cart
void removeFromCart(String productName, String productImage,double productPrice, int quantity){
  if (_cart.contains([productName,productImage,productPrice,quantity])) {
    _cart.removeWhere((element) => element == [productName,productImage,productPrice,quantity]);
  }
    //_cart.remove(removeItems);
    notifyListeners();
}


}

