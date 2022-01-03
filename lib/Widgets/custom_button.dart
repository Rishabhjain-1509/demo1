//Created By Rishabh Jain
//Created On Dec 24, 2021

//Libary use in this file.
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:demo/Constant/constant.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final double? width;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () => onTap.call(),
        child: txtDesign(text, 18.0, white, FontWeight.w500).centered(),
        style: ElevatedButton.styleFrom(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          primary: maincolor,
        ),
      ),
    );
  }
}
