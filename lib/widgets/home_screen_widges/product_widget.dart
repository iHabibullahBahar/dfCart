import 'package:dfcart/config/config.dart';
import 'package:dfcart/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

class ProductViewWidget extends StatelessWidget {
  final ProductModel product;
  const ProductViewWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          //width: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Row(
                  children: [
                    //-------Product Name Text-------//
                    Expanded(
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 14,
                          color: textColors,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                //-------Product Price Text-------//
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
                      " " + product.discountedPrice.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              //-------Product Old Price Text-------//
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Row(
                  children: [
                    Text(
                      currencyCode + " " + product.price.toString(),
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
                            ((((product.price - product.discountedPrice) /
                                            product.price) *
                                        100)
                                    .toInt())
                                .toString() +
                            "%",
                      ),
                    ),
                  ],
                ),
              ),
              //-------Product Orders And Rating Text-------//
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                child: Row(
                  children: [
                    Text(
                      product.totalOrder.toString() +
                          " orders  ★" +
                          product.rating.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
