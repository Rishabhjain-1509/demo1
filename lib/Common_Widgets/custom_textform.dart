//Created By Rishabh Jain
//Created On Dec 24, 2021

//Libary use in this file.
import 'package:flutter/material.dart';
import 'package:demo/Constant/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.labelText,
    this.maxLines,
    required this.controller,
    this.prefixIcon,
    this.validator,
    this.isEnabled,
    this.keyboardType,
  }) : super(key: key);
  final String? hintText;
  final String? labelText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final int? maxLines;
  final FormFieldValidator? validator;
  final bool? isEnabled;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      enabled: isEnabled,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: labelText,
        hintText: hintText,
        enabled: isEnabled ?? true,
        labelStyle: labelstl,
        focusedBorder: bord,
        enabledBorder: bord,
        disabledBorder: bord,
      ),
    );
  }
}
