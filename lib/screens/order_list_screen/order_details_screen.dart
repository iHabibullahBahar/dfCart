import 'package:dfcart/config/config.dart';
import 'package:dfcart/models/orders_model/orders_model.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderModel order;

  OrderDetailsScreen({required this.order});
  @override
  Widget build(BuildContext context) {
    final orderId = order.orderId.toString();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title:
            const Text("Order Details", style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(
          color: primaryColor,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(children: [
        Container(
            color: Colors.white,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              order.orderId.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                copyOrderIdToClipboard(context);
                              },
                              child: const Icon(
                                Icons.copy,
                                color: primaryColor,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
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
                        )
                      ],
                    ),
                    const Spacer(),

                    //---------------------------- Order Status ----------------------------//
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: Text(
                          order.orderStatus.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //--------------------Billing address-------------//
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Shipping Address",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 15,
                    ),
                    Text(" " + order.userName.toString()),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      size: 15,
                    ),
                    Text(" " + order.phoneNumber.toString()),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      size: 15,
                    ),
                    Text(
                      " " + order.shippingAddress.toString(),
                      style: const TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ])),
        const SizedBox(
          height: 10,
        ),

        //---------------- Order Status Bar ----------------//
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                // child: order.orderStatus == 'Placed'? StatusSection(orderStatus: OrderStatus.Shipped),

                child: (order.orderStatus == 'Placed')
                    ? StatusSection(orderStatus: OrderStatus.Pending)
                    : (order.orderStatus == 'Confirmed')
                        ? StatusSection(orderStatus: OrderStatus.Confirmed)
                        : (order.orderStatus == 'Shipped')
                            ? StatusSection(orderStatus: OrderStatus.Shipped)
                            : (order.orderStatus == 'Delivered')
                                ? StatusSection(
                                    orderStatus: OrderStatus.Delivered)
                                : (order.orderStatus == 'Cancelled')
                                    ? StatusSection(
                                        orderStatus: OrderStatus.Cancelled)
                                    : StatusSection(
                                        orderStatus: OrderStatus.Pending))),
        SizedBox(
          height: 10,
        ),
        //--------------------ordered products Section-------------//
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Products",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //--------------------ordered products-------------//
                for (var orderItems in order.orderItems!)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: 50,
                          width: 50,
                          child: ClipRRect(
                            child: Image.asset(
                              orderItems.productImage.toString(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(orderItems.productName.toString()),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(currencySymbol +
                                      orderItems.unitPrice.toString() +
                                      ' x ' +
                                      orderItems.productQuantity.toString()),
                                  Text(currencySymbol +
                                      orderItems.productPrice.toString())
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //--------------------Order Summary Section-------------//
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Order Summary",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                //--------------------Order Summary-------------//
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Subtotal"),
                    Text(currencySymbol + order.orderSubtotal.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Shipping"),
                    Text(
                      currencySymbol + order.deliveryCharges.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Discount",
                      style: TextStyle(),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      currencySymbol + order.orderDiscount.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      currencySymbol + order.orderTotal.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Payment Method: ",
                      style: TextStyle(),
                    ),
                    order.paymentMethod == 'Null'
                        ? const Text('Unpaid')
                        : Text(
                            order.paymentMethod.toString(),
                            style: const TextStyle(),
                          ),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  // Copy order id to clipboard and show snack-bar message to user
  void copyOrderIdToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: order.orderId.toString()))
        .then((result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Order ID copied to clipboard',
            textAlign: TextAlign.center,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: secondaryColor1,
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Add rounded corners
          ),
        ),
      );
    });
  }
}

enum OrderStatus {
  Cancelled,
  Pending,
  Confirmed,
  Shipped,
  Delivered,
}

class StatusSection extends StatelessWidget {
  final OrderStatus orderStatus;

  StatusSection({required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildStatusSection('Pending', OrderStatus.Pending),
        buildLine(),
        buildStatusSection('Confirmed', OrderStatus.Confirmed),
        buildLine(),
        buildStatusSection('Shipped', OrderStatus.Shipped),
        buildLine(),
        buildStatusSection('Delivered', OrderStatus.Delivered),
      ],
    );
  }

  Widget buildStatusSection(String title, OrderStatus status) {
    bool isActive = orderStatus.index >= status.index;
    bool isCancelled = orderStatus.index == OrderStatus.Cancelled.index;
    return Column(
      children: [
        Container(
          width: 25.0,
          height: 25.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCancelled
                ? Colors.red
                : isActive
                    ? Colors.green
                    : Colors.grey,
          ),
          child: isCancelled
              ? Icon(
                  Icons.cancel,
                  size: 16.0,
                  color: Colors.white,
                )
              : isActive
                  ? Icon(
                      Icons.check,
                      size: 16.0,
                      color: Colors.white,
                    )
                  : null,
        ),
        SizedBox(height: 5.0),
        Text(title),
      ],
    );
  }

  Widget buildLine() {
    return Expanded(
      child: Container(
        height: 0.0,
        color: Colors.grey[300],
        //margin: EdgeInsets.symmetric(horizontal: 10.0),
      ),
    );
  }
}
