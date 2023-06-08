import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../connectivity_screen.dart';

class LoginController extends GetxController {
  bool hideText = true;
  RxBool isLoading = false.obs;
  bool isValidate = true;
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> snackBarFormKey = GlobalKey<ScaffoldState>();
  //
  // postData() async {
  //   var response = await http
  //       .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
  //     'id': 1.toString(),
  //     'name': 'manish',
  //     'email': 'someemail i',
  //   });
  //   print('response.body');
  //   print(response.body);
  // }

  postDataApi() async {
    var response = await http.post(
      Uri.parse('http://192.168.43.34:3000/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": "${userIdController.text}",
        "password": "${passwordController.text}",
      }),
    );
    print(userIdController.text);
    print(passwordController.text);
    final data = jsonDecode(response.body);
    print(data['message']);
    if (data['message'] == 'user does not exist') {
      print('error in credentials');
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(data['message']),
        ),
      );
    } else {
      Get.to(
        // BluetoothOffScreen(),
        ConnectivityScreen(),
        transition: Transition.rightToLeft,
      );
    }

    // http.post(
    //   Uri.parse('http://192.168.43.34:3000/user/login'),
    //   body: jsonEncode({
    //     "username": "ranjan.saurabh",
    //     "password": "test_password2",
    //   }),
    // );
    // http.get(Uri.parse('http://192.168.43.34:3000/user/all'));
    // // body: {
    // "username": "saurabh.ranjan",
    // "password": "test_password1",
    // });
    ///////////////////////////////
    // print(response.);
    // print(response.body);
  }
  //
  // Future<void> sendMultipartRequest() async {
  //   final String apiUrl = 'http://192.168.43.34:3000/user/login';
  //   final http.MultipartRequest request =
  //       http.MultipartRequest('POST', Uri.parse(apiUrl));
  //   request.fields['username'] = 'ranjan.saurabh';
  //   request.fields['password'] = 'test_password';
  //   final http.StreamedResponse response = await request.send();
  //
  //   print(response.request);
  //
  //   print(await response.stream.bytesToString());
  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print('Request failed with status: ${response.statusCode}.');
  //   }
  // }

  void validate() async {
    if (formKey.currentState!.validate()) {
      await postDataApi();
      isLoading.value = false;
    } else {
      print('error in login validation');
      isLoading.value = false;
    }
  }
}
