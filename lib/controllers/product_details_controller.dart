import 'dart:convert';
import 'package:dfcart/models/product_model/product_details_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchProductDetails();
  }

  ProductDetailsModel productDetails = ProductDetailsModel();
  Future<void> fetchProductDetails() async {
    //fetch data from local json file
    var response =
        await rootBundle.loadString('assets/jsons/product_details.json');
    final data = await json.decode(response);
    productDetails = ProductDetailsModel.fromJson(data);
    isLoading.value = false;
  }
}
