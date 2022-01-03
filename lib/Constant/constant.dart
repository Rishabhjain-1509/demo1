//Created By Rishabh Jain.
//Created ON Dec 24, 2021

//Library import used in this dart file.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color maincolor = Color(0xFF304FFE);
const Color grey = Colors.grey;
const Color black = Colors.black;
const Color white = Colors.white;

final TextStyle labelstl = GoogleFonts.roboto(
    fontSize: 15.0, color: grey, fontWeight: FontWeight.w500);

final OutlineInputBorder bord = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
  borderSide: const BorderSide(
    color: grey,
    style: BorderStyle.solid,
    width: 1.2,
  ),
);

Widget txtDesign(str, siz, col, val) {
  return Text(
    str,
    style: GoogleFonts.roboto(fontSize: siz, color: col, fontWeight: val),
  );
}

const String pleaseWait = "Please wait";
