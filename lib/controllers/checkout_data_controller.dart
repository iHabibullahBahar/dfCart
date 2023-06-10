import 'dart:convert';

import 'package:dfcart/models/user_model/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CheckoutDataController extends GetxController {
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchUserInfo();
  }

  UserModel userInfo = UserModel();
  Future fetchUserInfo() async {
    var response = await rootBundle.loadString('assets/jsons/user_info.json');
    final data = await json.decode(response);
    userInfo = UserModel.fromJson(data);
    isLoading.value = false;
  }
}
