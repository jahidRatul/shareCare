import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;

  CustomInputField(
      {this.hintText,
        this.textEditingController,
        this.validator,
        this.autoValidateMode});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.only(left: 30, top: 10, right: 30),
      elevation: 10,

      child: TextFormField(
        controller: textEditingController,
        validator: validator,
        autovalidateMode: autoValidateMode,
        style: const TextStyle(fontSize: 20.0, color: Colors.white),
        cursorColor: const Color(0xFF9b9b9b),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key, color: Colors.cyanAccent),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          fillColor: MyColors.deepBlue2,
          isDense: true,
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          // focusedBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.white),
          //   borderRadius: BorderRadius.all(Radius.circular(10)),
          // ),
        ),
      ),
    );
  }
}