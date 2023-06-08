import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:officesolution/app/screens/commence_test.dart';

import 'bluetooth/connect.dart';

class SearchingWearable extends StatelessWidget {
  const SearchingWearable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
            Scaffold(backgroundColor: Colors.black, body: buildSearchingFor()));
  }

  Widget buildSearchingFor() {
    return Center(
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 35),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/pngs/logo.png',
              height: 100,
              width: 200,
            ),
          ),
          SizedBox(height: 45),
          const Text(
            "Searching for Wearable",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 45),
          const Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.wifi,
              color: Colors.white,
              size: 80,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Turn on the wearable',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Keep it nearby to establish the connection',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 45),
              ],
            ),
          ),
          Container(height: 400, child: FindDevicesScreen())
        ],
      ),
    );
  }

  Widget buildNotWorking() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 1,
        ),
        const Text(
          "Not Working?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Try turning Bluetooth on your phone off then on again'),
              SizedBox(height: 5),
              Text('Restart your werable'),
              SizedBox(height: 5),
              Text('Make sure your device is nearby'),
              SizedBox(height: 5),
              Text(
                  'Make sure your wearable isn\'t connected to a different phone'),
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        InkWell(
          onTap: () => Get.to(
            const CommenceTest(),
            transition: Transition.cupertino,
          ),
          child: const Text(
            'Try Again',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
