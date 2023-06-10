import 'package:dfcart/config/config.dart';
import 'package:dfcart/models/product_model/flash_sale_model.dart';
import 'package:dfcart/screens/product_details_screen/product_details_screen.dart';
import 'package:dfcart/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlashSaleWidget extends StatelessWidget {
  final List<FlashSaleProductModel> loadedFlashSaleProducts;
  FlashSaleWidget({required this.loadedFlashSaleProducts});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(
              width: 4,
            ),
            for (var item in loadedFlashSaleProducts)
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ProductDetailRoute,
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              item.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                          child: Row(
                            children: [
                              Text(
                                currencyCode,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              ),
                              Text(
                                " " + item.discountedPrice.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: Row(
                            children: [
                              Text(
                                currencyCode + " " + item.price.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red[50],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  " -" +
                                      ((((item.price - item.discountedPrice) /
                                                      item.price) *
                                                  100)
                                              .toInt())
                                          .toString() +
                                      "%",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                          child: Row(
                            children: [
                              Text(
                                item.totalOrder.toString() +
                                    " orders  ★" +
                                    item.rating.toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
