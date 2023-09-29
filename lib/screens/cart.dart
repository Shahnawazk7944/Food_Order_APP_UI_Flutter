import 'package:flutter/material.dart';
import 'package:food_offer/components/showEmpty_widget.dart';
import 'package:provider/provider.dart';

import '../app_utils.dart';
import '../components/primary_button.dart';

import '../models/shop.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  List itemList = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/home");
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
            "Cart",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
                fontFamily: primaryFont),
          ),
          toolbarHeight: 50,
        ),
        bottomNavigationBar: value.cart.isEmpty == true ? null: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: PrimaryButton_widget(
              onPressed: () {},
              text: "Proceed to checkout"),
        ),
        body: value.cart.isEmpty == true ? const ShowEmpty_Widget(heading: "No items in your cart", imgSource: 'asset/icons/browser.png'): Container(
          color: Colors.white,
          child: ListView.builder(
              itemCount: value.cart.length,
              itemBuilder: (context, index) {
                //final List cartItems = value.cart[index];
                itemList.add(value.cart[index]);
                final String name = itemList[index][0];
                final String image = itemList[index][1];
                final double price = itemList[index][2];
                int quantity = itemList[index][3];
                double multiPliedPrice = price * quantity;

                // --------------- Cart Item Details Main Box --------------------
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10,
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10,
                    ),
                    height: 140,
                    constraints: const BoxConstraints(
                      //minHeight: 140,
                      maxHeight: 180,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      //color: Colors.grey.withOpacity(0.3),
                      color: foodMenuColor1,
                      // border: Border.all(),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ],
                    ),

                    // --------------- Cart Items Details Row --------------------

                    child: Row(
                      children: [
                        // --------------- Cart Items Delete Icon--------------------
                        GestureDetector(
                          onTap: (){

                            setState(() {
                              value.cart.removeAt(index);
                              setState(() {});
                            });
                          },
                          child: Image.asset(
                            "asset/icons/delete.png",
                            color: iconsColor,
                            height: 25,
                            width: 25,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),

                        // --------------- Cart Items Like Icon --------------------

                        Image.asset(
                          "asset/icons/heart.png",
                          color: iconsColor,
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 15,
                        ),

                        // --------------- Cart Items Image --------------------

                        Image.network(
                          image,
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(
                          width: 15,
                        ),

                        // --------------- Cart Items Name --------------------

                        Padding(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Container(
                                  constraints:
                                      const BoxConstraints(minHeight: 60),
                                  //height: 60,
                                  width: 120,
                                  child: Text(
                                    name,
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: primaryFont),
                                  ),
                                ),
                              ),

                              // --------------- Cart Items Counter --------------------

                              Container(
                                // --------------- Counter Box --------------------

                                height: 30,
                                width: MediaQuery.of(context).size.width / 4.2,
                                //width: 130,
                                decoration: BoxDecoration(
                                  // color: Color(0XffF1F1F1),
                                  //color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // --------------- Counter Minus --------------------
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (quantity >= 1) {
                                            setState(() {
                                              quantity--;
                                              if(quantity==0){
                                                quantity++;
                                              }
                                              //cartItems[index]=quantity;
                                              value.cart[index].replaceRange(3,4,[quantity]);
                                              //cartItems[index].update(3,[quantity]);
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              14,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                              child: Image.asset(
                                            "asset/icons/minus.png",
                                            height: 15,
                                            width: 15,
                                          )),
                                        ),
                                      ),
                                    ),

                                    // --------------- Counter Text --------------------

                                    Center(
                                      child: Text(
                                        quantity.toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w100,
                                          fontFamily: primaryFont,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                    // --------------- Counter Plus --------------------

                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (quantity >= 0) {
                                            setState(() {
                                              quantity++;
                                              //cartItems[index]=quantity;
                                              value.cart[index].replaceRange(3,4,[quantity]);
                                              //cartItems[index].update(3,[quantity]);
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              14,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                              child: Image.asset(
                                            "asset/icons/plus.png",
                                            height: 15,
                                            width: 15,
                                          )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: 50,
                          child: Flexible(
                            child: Text(
                              "Total \$${multiPliedPrice.toStringAsFixed(2)}",
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontFamily: primaryFont),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 0,
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
