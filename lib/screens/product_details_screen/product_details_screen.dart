import 'dart:convert';

import 'package:dfcart/config/config.dart';
import 'package:dfcart/controllers/product_details_controller.dart';
import 'package:dfcart/models/product_model/product_details_model.dart';
import 'package:dfcart/widgets/product_details_widget/bottom_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  var productDetailsController = Get.put(ProductDetailsController());

  //Product Details
  ProductDetailsModel? product;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productDetailsController.isLoading == true) {
        return Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      } else {
        product = productDetailsController.productDetails;
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            actionsIconTheme: const IconThemeData(
              color: primaryColor,
            ),
            elevation: 0,
            backgroundColor: backgroundColor,
            actions: [
              //---- WishList Icon ----//
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                ),
              ),
              //---- Share Icon ----//
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                ),
              ),
            ],
          ),
          body: ListView(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    // ----------------------------- Product Images ---------------------- //
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        for (var image in product!.images!)
                          Container(
                            color: whiteColor,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ),
                      ]),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: whiteColor,
                        ),
                        child: Column(
                          children: [
                            // ----------------------------- Product Name ---------------------- //
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  product!.name!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            // ----------------------------- Product Price Section ---------------------- //
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    currencySymbol,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: primaryColor,
                                    ),
                                  ),
                                  Text(
                                    product!.discountedPrice.toString(),
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    currencySymbol +
                                        "" +
                                        product!.originalPrice.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: textColors,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.red[100],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "-" +
                                            (((product!.originalPrice! -
                                                            product!
                                                                .discountedPrice!) /
                                                        product!
                                                            .originalPrice!) *
                                                    100)
                                                .toStringAsFixed(0) +
                                            "%",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Divider(),
                            ),
                            // -------------------------- Product Rating And Total Sell section ------------------ //
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "★ ",
                                    style: TextStyle(
                                      color: ratingColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    product!.rating.toString() +
                                        "5 (" +
                                        product!.totalReviews.toString() +
                                        ")",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(product!.totalPurchases.toString() +
                                      " orders"),
                                ],
                              ),
                            ),
                            // -------------------------- Product  Delivery Fee section ------------------ //
                            if (product!.freeShipping!)
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green[50]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.local_shipping,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Free Shipping",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green),
                                            ),
                                            Text(
                                              "Limited time offer : Don't miss it",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    // -------------------------- Product  Reviews and Rating section ------------------ //
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Reviews & Ratings" +
                                        " (" +
                                        product!.totalReviews.toString() +
                                        ")",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "View All",
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 14,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            // -------------------------- All Reviews ------------------ //
                            for (var review in product!.reviews!)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(review.userName!),
                                          RatingBar.builder(
                                            initialRating:
                                                review.rating!.toDouble(),
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 15,
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(review.review!),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),

                    // -------------------------- Product  Description section ------------------ //
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "Product Details",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 8,
                              ),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(product!.description!),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // -------------------------- Product  Similar Products section ------------------ //
                    Container()
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomBar(
            productID: product!.id!,
            onBuyNowPressed: () {},
            onAddToCartPressed: () {},
          ),
        );
      }
    });
  }
}
