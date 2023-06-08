import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:officesolution/app/screens/authentication/forgot_password/forgot_your_password.dart';
import 'package:officesolution/app/screens/authentication/login_page/login_controller.dart';

import '/app/screens/authentication/auth_mixin.dart';
import '../../../utils/config.dart';
import '../../connectivity_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with AuthMixin {
  LoginController loginController = Get.put(LoginController());

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
                      'Log IN',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Form(
                  key: loginController.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'User ID',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      buildTextField(
                        controller: loginController.userIdController,
                        title: '',
                        isPassword: false,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      buildTextField(
                          controller: loginController.passwordController,
                          title: '',
                          isPassword: true,
                          hideText: loginController.hideText.obs,
                          isValidate: loginController.isValidate),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () => Get.to(ForgotYourPassword()),
                      child: const Text(
                        'Forgot your password',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => (loginController.isLoading.value == true)
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : buildButtons(
                          title: 'Login',
                          fontSize: 24,
                          onPressed: () {
                            Get.to(
                              ConnectivityScreen(),
                              // BluetoothOffScreen(),
                              // TestCompleted(),
                              transition: Transition.rightToLeft,
                            );
                            // loginController.isValidate = true;
                            //
                            // loginController.isLoading.value = true;
                            //
                            // loginController.validate();
                          },
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

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackBar(
          {required String title, required Color color}) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.white,
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: 90,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 48,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      const Text(
                        'Message',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ))
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(20)),
                child: Image.asset(
                  'assets/pngs/bubble.png',
                  height: 60,
                  width: 60,
                  color: color,
                ),
              ),
            ),
            Positioned(
                top: -12,
                left: 0,
                child: InkWell(
                    onTap: () {},
                    child: ClipOval(
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          color: const Color(0xFF801336),
                          child: const Icon(
                            Icons.abc,
                            color: Colors.white,
                          )),
                    )))
          ],
        ),
      ));

  // Widget buildButtons({
  //   required String title,
  // }) =>
  //     Container(
  //       height: 50,
  //       margin: const EdgeInsets.symmetric(vertical: 10),
  //       width: double.infinity,
  //       child: ElevatedButton(
  //         style: ButtonStyle(
  //           backgroundColor: MaterialStateProperty.all(ColorClass.baseColor),
  //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //             RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(5.0),
  //               side: const BorderSide(
  //                 color: Colors.lightBlueAccent,
  //               ),
  //             ),
  //           ),
  //         ),
  //         onPressed: () {
  //           loginController.isValidate = true;
  //           setState(() {
  //             loginController.isLoading = true;
  //           });
  //           loginController.validate();
  //         },
  //         child: (loginController.isLoading == true)
  //             ? const CircularProgressIndicator(
  //                 color: Colors.white,
  //               )
  //             : Text(
  //                 title,
  //                 style: const TextStyle(color: Colors.white),
  //               ),
  //       ),
  //     );
}
