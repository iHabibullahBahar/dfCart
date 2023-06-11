import 'package:dfcart/controllers/oders_data_controller.dart';
import 'package:dfcart/models/orders_model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  var orderDataController = Get.put(OrderDataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order List'),
      ),
      body: Obx(() {
        if (orderDataController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          var orderList = orderDataController.orderList;
          return Center(
            child: Container(
              height: 160,
              width: 160,
              child: ElevatedButton(
                  onPressed: () {}, child: Center(child: Text("Click Me"))),
            ),
          );
        }
      }),
    );
  }
}
