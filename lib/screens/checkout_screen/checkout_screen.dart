import 'package:dfcart/config/config.dart';
import 'package:dfcart/controllers/checkout_data_controller.dart';
import 'package:dfcart/controllers/product_details_controller.dart';
import 'package:dfcart/models/product_model/product_details_model.dart';
import 'package:dfcart/models/user_model/user_model.dart';
import 'package:dfcart/widgets/checkout_widget/checkout_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  var checkoutDataController = Get.put(CheckoutDataController());
  var productDetailsController = Get.put(ProductDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: primaryColor,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Checkout Information",
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      body: Obx(() {
        if (checkoutDataController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          UserModel userInfo = checkoutDataController.userInfo;
          ProductDetailsModel product = productDetailsController.productDetails;
          String productImage = product.images![0];
          return ListView(
            children: [
              // ---------------- Delivery Address ----------------//
              const Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: Text("Delivery Address",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.home),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  userInfo!.userName!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                  ),
                                  radius: 12,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              userInfo!.userPhone!,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              userInfo!.userAddresses![0].address!,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //----------------- Checkout Products section -----------------//

              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                child: Container(
                  child: Text(
                    "Products",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                    child: Row(
                      children: [
                        Container(
                          child: ClipRRect(
                            child: Image.asset(productImage,
                                width: 80, height: 80, fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product!.name!,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text(
                                    currencySymbol +
                                        " " +
                                        product!.discountedPrice!.toString() +
                                        " x 1",
                                  ),
                                  Spacer(),
                                  Text(
                                    currencySymbol +
                                        " " +
                                        product!.discountedPrice!.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //------------------ Order Summary ------------------//
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                child: Container(
                  child: Text(
                    "Order Summary",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Subtotal",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Spacer(),
                            Text(
                              currencySymbol +
                                  " " +
                                  product!.discountedPrice!.toString(),
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Shipping",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Spacer(),
                            Text(
                              currencySymbol + " 0",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              currencySymbol +
                                  " " +
                                  product!.discountedPrice!.toString(),
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      }),
      bottomNavigationBar: CheckoutScreenBottomBar(
        productID: 0,
        onBuyNowPressed: () {},
      ),
    );
  }
}
