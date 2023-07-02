import 'package:dfcart/config/config.dart';
import 'package:dfcart/controllers/oders_data_controller.dart';
import 'package:dfcart/models/orders_model/orders_model.dart';
import 'package:dfcart/widgets/order_widgets/order_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  var orderDataController = Get.put(OrderDataController());
  int _selectedIndex = 0;
  final List<String> _tabs = [
    '  All Orders',
    'Pending',
    'Confirmed',
    'Shipped',
    'Delivered',
    'Cancelled  '
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: const IconThemeData(
          color: primaryColor, // Set your desired icon color here
        ),
        elevation: 0,
        title: const Text(
          'Order List',
          style: TextStyle(color: textColors),
        ),
      ),
      body: Obx(() {
        if (orderDataController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          var orderList = orderDataController.orderList;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _tabs.asMap().entries.map((entry) {
                      final int index = entry.key;
                      final String tab = entry.value;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            tab,
                            style: TextStyle(
                              color: _selectedIndex == index
                                  ? primaryColor
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    child: Column(
                  children: [
                    for (var order in orderList)
                      if (_selectedIndex == 0)
                        OrderCard(
                          order: order,
                        )
                      else if (_selectedIndex == 1 &&
                          order.orderStatus == 'Placed')
                        OrderCard(order: order)
                      else if (_selectedIndex == 2 &&
                          order.orderStatus == 'Confirmed')
                        OrderCard(order: order)
                      else if (_selectedIndex == 3 &&
                          order.orderStatus == 'Shipped')
                        OrderCard(order: order)
                      else if (_selectedIndex == 4 &&
                          order.orderStatus == 'Delivered')
                        OrderCard(order: order)
                      else if (_selectedIndex == 5 &&
                          order.orderStatus == 'Cancelled')
                        OrderCard(order: order)
                  ],
                )),
              ),
            ],
          );
        }
      }),
    );
  }
}
