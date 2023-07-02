import 'dart:convert';

import 'package:dfcart/models/orders_model/orders_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OrderDataController extends GetxController {
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchOrderData();
  }

  List<OrderModel> orderList = [];
  Future<void> fetchOrderData() async {
    //fetch data from local json file
    var response = await rootBundle.loadString('assets/jsons/orders_data.json');
    final data = await json.decode(response);
    for (var item in data) {
      orderList.add(OrderModel.fromJson(item));
    }
    isLoading.value = false;
  }
}
