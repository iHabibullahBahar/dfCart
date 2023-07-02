import 'package:dfcart/config/config.dart';
import 'package:dfcart/models/orders_model/orders_model.dart';
import 'package:dfcart/screens/order_list_screen/order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  OrderModel order;
  OrderCard({super.key, required this.order});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderDetailsScreen(order: order)));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.orderId.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    //-------------------------- Order Date and Time -------------------------//
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          color: Colors.black54,
                          size: 15,
                        ),
                        Text(
                          DateFormat(' dd MMM yyyy').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  order.orderDate!)),
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.access_time,
                          color: Colors.black54,
                          size: 15,
                        ),
                        Text(
                          DateFormat(' hh:mm a').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                order.orderDate!),
                          ),
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("$currencySymbol ${order.orderTotal}",
                        style: const TextStyle(
                          color: primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                //--------------Order Status COLOR Box Container-----------------//
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: Container(
                        decoration: BoxDecoration(
                          color: order.orderStatus == 'Delivered'
                              ? secondaryColor1
                              : order.orderStatus == 'Shipped'
                                  ? primaryColor
                                  : order.orderStatus == 'Placed'
                                      ? secondaryColor2
                                      : Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            order.orderStatus!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }
}
