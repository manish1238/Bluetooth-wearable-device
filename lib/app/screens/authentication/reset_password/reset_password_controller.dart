import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '/app/screens/authentication/login_page/login.dart';

class ResetPasswordController extends GetxController {
  TextEditingController previousPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxString data = ''.obs;
  RxBool isLoading = false.obs;
  void setData(String value) {
    data.value = value;
  }

  void validate() async {
    if (formKey.currentState!.validate()) {
      if (newPasswordController.text == confirmPasswordController.text) {
        print('success match');
        resetApi();
      } else {
        print('not matched');
        isLoading.value = false;
      }
    }
  }

  resetApi() async {
    var response = await http.post(
      Uri.parse('http://192.168.43.34:3000/user/reset'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        //from previous screen
        "username": "${data.value}",
        "prev_password": "${previousPasswordController.text}",
        "new_password": "${confirmPasswordController.text}",
      }),
    );
    final dataResponse = jsonDecode(response.body);
    print("username: ${data.value}");
    print(dataResponse['message']);
    print(response.statusCode);
    if (dataResponse['message'] == 'user does not exist') {
      print('error in credentials');
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(dataResponse['message']),
        ),
      );
      isLoading.value = false;
    } else {
      previousPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();
      Get.offAll(
        // BluetoothOffScreen(),
        LoginPage(),
        transition: Transition.rightToLeft,
      );
    }
  }
}
