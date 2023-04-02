import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class BooksInputField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final TextCapitalization textCapitalization;

  BooksInputField(
      {this.hintText,
        this.textEditingController,
        this.validator,
        this.autoValidateMode,this.textCapitalization= TextCapitalization.none});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
      elevation: 10,

      child: TextFormField(
        controller: textEditingController,
        validator: validator,
        autovalidateMode: autoValidateMode,textCapitalization: textCapitalization,
        style: const TextStyle(fontSize: 20.0, color: Colors.white),
        cursorColor: const Color(0xFF9b9b9b),
        decoration: InputDecoration(

          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey,fontSize: 16),
          fillColor: MyColors.deepBlue3,
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