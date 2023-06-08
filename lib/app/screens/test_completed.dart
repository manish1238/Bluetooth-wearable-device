import 'package:flutter/material.dart';
import 'package:officesolution/app/screens/authentication/auth_mixin.dart';

class TestCompleted extends StatefulWidget {
  const TestCompleted({Key? key}) : super(key: key);

  @override
  State<TestCompleted> createState() => _TestCompletedState();
}

class _TestCompletedState extends State<TestCompleted> with AuthMixin {
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
                      'Test Completed...',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Device Name / ID : bbb',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Patient ID :123',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Notes : this patient is suffereing from sugar and it\s  sugar level is 103 which is fine suggesting him to take sugar pill 1 time a day',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Final Log',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Test ID : PatientID and Date',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Total Data Sweeps : 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Status: Data collected, data upload, sweep completed etc...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Timer : XXMins',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                buildButtons(
                  title: 'Start New Test',
                  fontSize: 24,
                  onPressed: () {},
                ),
                buildButtons(
                  title: 'Unpair',
                  fontSize: 24,
                  onPressed: () {
                    // Get.to(
                    //   // BluetoothOffScreen(),
                    //   ConnectivityScreen(),
                    //   transition: Transition.rightToLeft,
                    // );
                    // loginController.isValidate = true;
                    //
                    // loginController.isLoading.value = true;
                    //
                    // loginController.validate();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
