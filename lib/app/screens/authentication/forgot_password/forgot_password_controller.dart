import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../reset_password/reset_password_controller.dart';
import '../reset_password/reset_your_password.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController userIdController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  void sendDataToDestination() {
    String data = "${userIdController.text}";
    Get.find<ResetPasswordController>().setData(data);
  }

  void onInit() {
    super.onInit();
    isLoading.value = false;
    print(isLoading.value);
  }

  void validate() async {
    if (formKey.currentState!.validate()) {
      sendDataToDestination();
      userIdController.clear();
      Get.to(ResetYourPassword());
      isLoading.value = false;
    } else {
      print('error in login validation');
      isLoading.value = false;
    }
  }
}
