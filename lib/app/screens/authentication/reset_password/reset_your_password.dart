import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:officesolution/app/screens/authentication/auth_mixin.dart';
import 'package:officesolution/app/screens/authentication/reset_password/reset_password_controller.dart';

import '../../../utils/config.dart';

class ResetYourPassword extends StatefulWidget {
  const ResetYourPassword({Key? key}) : super(key: key);

  @override
  State<ResetYourPassword> createState() => _ResetYourPasswordState();
}

// http://192.168.43.34:3000/user/login
class _ResetYourPasswordState extends State<ResetYourPassword> with AuthMixin {
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ResetPasswordController controller = Get.put(ResetPasswordController());
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
                      'Reset Password',
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
                            'Previous Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      buildTextField(
                        controller: controller.previousPasswordController,
                        title: '',
                        isPassword: false,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'New Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: buildTextField(
                          controller: controller.newPasswordController,
                          title: '',
                          isPassword: false,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Confirm Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: buildTextField(
                          controller: controller.confirmPasswordController,
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
                            title: 'Login',
                            fontSize: 25,
                            onPressed: () {
                              // print('hh dd');
                              // print(controller.data.value);
                              controller.validate();
                              // print(controller.data.value);
                            },
                          ),
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
}
