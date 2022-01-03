//Created By Rishabh Jain.
//Created On Jan 3, 2022

import 'package:demo/Pages/LoginPhase/otpscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:demo/Constant/constant.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phone = TextEditingController();
  String val = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //Image on the first
            Image.asset(
              'assets/images/Login1.png',
            ),
            const SizedBox(
              height: 50.0,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    txtDesign("Enter your phone number to get", 20.0,
                        Colors.black, FontWeight.bold),
                    txtDesign("started", 20.0, Colors.black, FontWeight.bold),

                    const SizedBox(
                      height: 20.0,
                    ),

                    //Message of getting otp.
                    txtDesign(
                        "You will receive a verification code. Carrier rates may apply.",
                        17.0,
                        Colors.grey,
                        FontWeight.bold),

                    const SizedBox(
                      height: 30.0,
                    ),

                    TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.grey,

                      cursorHeight: 25.0,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        focusColor: Colors.grey,
                        hoverColor: Colors.grey,
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.grey,
                          size: 18,
                        ),
                        prefix: Padding(
                          padding: const EdgeInsets.only(
                            right: 5,
                          ),
                          child: txtDesign(
                              '+91', 17.0, Colors.grey, FontWeight.bold),
                        ),
                        labelText: "Phone Number",
                        // hintText: 'Mobile Number',
                        hintStyle: GoogleFonts.roboto(color: Colors.grey),
                        focusedBorder: bord,
                        errorBorder: bord,
                        enabledBorder: bord,
                        focusedErrorBorder: bord,
                        border: bord,
                        errorStyle: GoogleFonts.roboto(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                        labelStyle: GoogleFonts.ptSans(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),

                      //Validate and check the input you given in the
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          val = value.toString();
                          return 'Please enter some text!';
                        } else if (value.length > 10 || value.length < 10) {
                          val = value.toString();
                          return 'Please enter a 10 digit Mobile Number!';
                        } else if (value[0] == '3' ||
                            value[0] == '2' ||
                            value[0] == '1' ||
                            value[0] == '4' ||
                            value[0] == '5') {
                          // ignore: avoid_print
                          print(value[0]);
                          val = value.toString();
                          return 'Please enter a correct Mobile Number!';
                        }
                      },

                      //Controller of the input text.
                      controller: _phone,
                    ),

                    // Size height between the Text Field and Button.
                    const SizedBox(
                      height: 20.0,
                    ),

                    //Get otp button design.
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent[700],
                          minimumSize: const Size(double.infinity, 50.0)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OTPScreen(phone: _phone.text),
                            ),
                          );
                        }
                      },
                      child: Text(
                        " Get OTP ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ptSans(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ).px12())
          ],
        ),
      ),
    );
  }
}
