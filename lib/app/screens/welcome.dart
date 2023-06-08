import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/config.dart';
import 'authentication/login_page/login.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            const Text(
              'Welcome',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            ElevatedButton(
              onPressed: () => Get.to(
                const LoginPage(),
                transition: Transition.leftToRight,
              ),
              child: const Text('Get Started'),
            ),
            const Spacer(
              flex: 2,
            ),
            Text(Config.poweredBy),
            Text(Config.versionNumber),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
