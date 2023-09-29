import 'package:flutter/material.dart';
import 'package:food_offer/app_utils.dart';
import 'package:food_offer/components/home_page_bottomMenu_widget.dart';
import 'package:food_offer/models/foodMenu.dart';
import 'package:food_offer/models/shop.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final FoodMenu product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  //---------------------Change Image location index----------------------
  int imgIndex = 0;
  changeImage(int imgNo) {
    setState(() {
      imgIndex = imgNo;
    });
  }

//---------------------  Add to Card  ----------------------
  double quantity = 1;
  checkQuantity(String operations) {
    if (quantity >= 0 && operations == "plus") {
      setState(() {
        quantity++;
      });
    } else if (quantity >=1 && operations == "minus") {
      setState(() {
        quantity--;
        if(quantity==0){
          quantity++;
        }
      });
    }
  }

  void addToCard() {
    // only add to card if there something
    if (quantity > 0) {
      // get access to Products
      final shop = context.read<Shop>();


      // Add to card
      shop.addToCart(widget.product.products![imgIndex]['name'],
          widget.product.products![imgIndex]['image'],
          widget.product.products![imgIndex]['price'],quantity.toInt());
      print(shop.cart);
      // let users know product was added successfully
      WidgetsBinding.instance.addPostFrameCallback((_){
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
              content: const Text("Successfully Added"),
              actions: [
                IconButton(onPressed: ()=> Navigator.pop(context), icon:const  Icon(Icons.done_outline))
              ],
            ));
      });

    }
  }

  // --------------- Navigate to Cart Page Function ---------------

  navigateToCartPageFromProduct() {
    Navigator.pushNamed(context, "/cart");
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => const HomePageBottomMenu()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --------------- App Bar ---------------
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.product.name.toString(),
                  //widget.product.products!["name"].toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: primaryFont),
                ),
              ),
            ),

            // --------------- App Bar Shopping Cart ---------------
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => navigateToCartPageFromProduct(),
                  child: Image.asset("asset/icons/shopping-cart.png",
                      height: 28, width: 28, color: iconsColor),
                ),
              ),
            )
          ],
        ),
        toolbarHeight: 50,
      ),

      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --------------- Product Page top Menu ---------------

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            Text(
                              "All Items",
                              style: TextStyle(
                                  fontFamily: primaryFont,
                                  fontSize: 15,
                                  color: secondaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                                width: 80,
                                child: Divider(
                                  height: 2,
                                  color: secondaryColor,
                                ))
                          ],
                        ),
                      ),
                      Text(
                        "New Items",
                        style: TextStyle(
                            fontFamily: primaryFont,
                            fontSize: 15,
                            color: colorGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Recommended",
                        style: TextStyle(
                            fontFamily: primaryFont,
                            fontSize: 15,
                            color: colorGrey,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Special",
                        style: TextStyle(
                            fontFamily: primaryFont,
                            fontSize: 15,
                            color: colorGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  // --------------- Product Image Viewer ----------------

                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: Colors.blueAccent,
                      // ),),
                      // padding: EdgeInsets.all(0),
                      //margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width / 1.6,
                            child: Image.network(
                              widget.product.products![imgIndex]['image']
                                  .toString(),
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context)
                                .size
                                .height, //double.maxFinite,
                            width: MediaQuery.of(context).size.width * .25,
                            child: ListView.builder(
                                //physics: const NeverScrollableScrollPhysics(),
                                itemCount: widget.product.products!.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      changeImage(index);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Image.network(
                                          widget.product.products![index]['image']
                                              .toString(),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      )),

                  // --------- **** Product Details Section **** -----------

                  SizedBox(
                    //height: MediaQuery.of(context).size.height,
                    // width: MediaQuery.of(context).size.width,
                    // decoration: BoxDecoration(
                    //     border: Border.all()
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),

                          // --------------- Product Name ------------------------

                          Container(

                            //height: 100,
                            constraints: const BoxConstraints(
                              minHeight: 80,
                            ),
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.blueAccent,
                            //   ),),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    width: MediaQuery.of(context).size.width / 1.5,
                                    child: Flexible(
                                      child: Text(
                                        widget.product.products![imgIndex]["name"]
                                            .toString(),
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: primaryFont,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    "asset/icons/heart.png",
                                    height: 40,
                                    width: 40,
                                    color: thirdColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // --------------- Product Description ------------------

                          Container(
                            // decoration: BoxDecoration(
                            //     border: Border.all()
                            // ),
                            //height: 60,
                            constraints:const  BoxConstraints(
                              minHeight: 120
                            ),


                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Flexible(
                              child: Text(
                                widget.product.products![imgIndex]["desc"]
                                    .toString(),
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: primaryFont,
                                  color: colorGrey,
                                ),
                              ),
                            ),
                          ),

                          // --------------- Product Price ----------------------

                          const SizedBox(
                            height: 15,
                          ),

                          Container(
                            // decoration: BoxDecoration(
                            //     border: Border.all()
                            // ),
                            constraints: const BoxConstraints(
                                minHeight: 40
                            ),
                            alignment: Alignment.centerLeft,

                            // height: 50,
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Text(
                              "\$ ${widget.product.products!
                              [imgIndex]["price"]}",

                              // "\$ ${double.parse((double.parse(widget.product.products!
                              // [imgIndex]["price"])*quantity).toStringAsExponential(2))}",
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                fontFamily: primaryFont,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          // --------------- Product Add to Cart ---------------
                          const SizedBox(
                            height: 20,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // --------------- Counter --------------------

                              Container(
                                // --------------- Counter Box --------------------

                                height: 35,
                                width: MediaQuery.of(context).size.width / 3.5,
                                //width: 130,
                                decoration: BoxDecoration(
                                  // color: Color(0XffF1F1F1),
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // --------------- Counter Minus --------------------
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: GestureDetector(
                                        onTap: () => checkQuantity("minus"),
                                        child: Container(
                                          height:
                                              MediaQuery.of(context).size.height,
                                          width: MediaQuery.of(context).size.width /
                                              14,
                                          decoration: BoxDecoration(
                                            color: Colors.white54,
                                            borderRadius: BorderRadius.circular(12),
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
                                        quantity.toInt().toString(),
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
                                        onTap: () => checkQuantity("plus"),
                                        child: Container(
                                          height:
                                              MediaQuery.of(context).size.height,
                                          width: MediaQuery.of(context).size.width /
                                              14,
                                          decoration: BoxDecoration(
                                            color: Colors.white54,
                                            borderRadius: BorderRadius.circular(12),
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

                              // --------------- Add Button --------------------

                              GestureDetector(
                                onTap: addToCard,
                                child: Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width / 2.8,
                                  //width: 150,
                                  decoration: const BoxDecoration(
                                    color: thirdColor,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(18),
                                        bottomRight: Radius.circular(18),
                                        bottomLeft: Radius.circular(18)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      " Add To Cart ",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w100,
                                        fontFamily: primaryFont,
                                        color: colorWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
