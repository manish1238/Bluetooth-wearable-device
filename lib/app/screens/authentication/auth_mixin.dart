import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:officesolution/app/utils/color.dart';

mixin AuthMixin {
  Widget buildTextField({
    required String title,
    required bool isPassword,
    required TextEditingController controller,
    RxBool? hideText,
    bool? isValidate,
  }) =>
      Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          controller: controller,
          obscureText: isPassword ? hideText!.value : false,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
            ),
            suffixIcon: isPassword
                ? Obx(() => IconButton(
                    icon: hideText!.value
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      // setState(() {
                      hideText.value = !hideText!.value;
                      print(hideText);
                      print('woring');
                    }
                    // }),
                    ))
                : null,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueAccent,
                width: 1.0,
              ),
            ),
            hintText: title,
          ),
          validator: (val) {
            if (val!.isEmpty) {
              return 'Please fill the Required fields';
            } else if (isValidate == false) {
              return 'Please enter correct Field';
            } else {
              return null;
            }
          },
        ),
      );

  Widget buildButtons({
    required String title,
    required double fontSize,
    required VoidCallback onPressed,
  }) =>
      Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ColorClass.baseColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ),
          onPressed: onPressed,
          // {
          // _isValidate = true;
          // setState(() {
          //   _isLoading = true;
          // });
          // validate();
          // },
          child:
              // (_isLoading == true)
              //     ? const CircularProgressIndicator(
              //         color: Colors.white,
              //       )
              //     :
              Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: fontSize),
          ),
        ),
      );
}
