import 'package:flutter/material.dart';

import 'authentication/auth_mixin.dart';

class CommenceTest extends StatelessWidget with AuthMixin {
  const CommenceTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Commence Test",
                style: TextStyle(
                  //tree saking
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Device Name/ ID : bbbbbbbb",
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Patient ID',
                          style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.white,
                            // margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              // controller: controller,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please fill the Required fields';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Notes',
                          style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.white,
                            // margin: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              // textInputAction: TextInputAction.next,
                              // controller: controller,
                              maxLines: 10,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please fill the Required fields';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: buildButtons(
                      title: 'Cancel',
                      fontSize: 24,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: buildButtons(
                      title: 'start',
                      fontSize: 24,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
