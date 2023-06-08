import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '/app/screens/authentication/auth_mixin.dart';
import '/app/screens/authentication/forgot_password/forgot_password_controller.dart';
import '../../../utils/config.dart';
import '../reset_password/reset_password_controller.dart';

class ForgotYourPassword extends StatelessWidget with AuthMixin {
  ForgotYourPassword({Key? key}) : super(key: key);

  ResetPasswordController resetController = Get.put(ResetPasswordController());
  ForgotPasswordController controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/pngs/logo.png',
                  height: 100,
                  width: 200,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Forgot your password',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 25, bottom: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'USER ID',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 35),
                        child: buildTextField(
                          controller: controller.userIdController,
                          title: '',
                          isPassword: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: buildButtons(
                              title: 'Send Reset Email',
                              fontSize: 25,
                              onPressed: () => controller.validate()),
                        ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Powered by: ${Config.poweredBy}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Version No ${Config.versionNumber}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  postDataApi() async {
    var response = await http.get(Uri.parse(''));
    final data = jsonDecode(response.body);
    print('');
    if (data['message'] == 'user does not exist') {
      print('error in credentials');
    } else {}

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
}
