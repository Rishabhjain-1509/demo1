//Created By Rishabh Jain.
//Created On Jan 3, 2022.

import 'package:demo/Pages/Home/home.dart';
import 'package:demo/Services/Functions/functions_extra.dart';
import 'package:demo/Services/Helper/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:demo/Constant/constant.dart';
import 'package:demo/Models/user.dart';

// ignore: must_be_immutable
class FormScreen extends StatefulWidget {
  final String phone;
  final String refCode;

  const FormScreen({Key? key, required this.phone, required this.refCode})
      : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _number = TextEditingController();
  bool retailer = false;
  @override
  Widget build(BuildContext context) {
    _number.text = widget.phone;
    return Scaffold(
      appBar: AppBar(
        //Designing of the AppBar.
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 60,
        backgroundColor: Colors.blueAccent[700],
        title: const Text(
          "Form",
        ),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              10.heightBox,
              //Field for name entry.
              TextFormField(
                autofocus: true,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.name,
                cursorColor: maincolor,
                cursorHeight: 25.0,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.account_circle,
                    size: 25,
                  ),
                  hintText: "Your name",
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                  ),
                  fillColor: maincolor,
                  focusColor: maincolor,
                  hoverColor: maincolor,
                  errorStyle: GoogleFonts.ptSans(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name !";
                  }
                },
                controller: _name,
              ),
              20.heightBox,
              //Data Entry of phone Number.
              TextFormField(
                cursorColor: maincolor,
                cursorHeight: 25.0,
                enabled: false,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.phone,
                    size: 25,
                  ),
                  // labelText: 'Mobile Number',
                  fillColor: maincolor,
                  focusColor: maincolor,
                  hoverColor: maincolor,
                  hintText: "Your name",
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                  ),

                  errorStyle: GoogleFonts.ptSans(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Number should not be empty !";
                  }
                },
                controller: _number,
              ),
              20.heightBox,
              //Field for Email Address entry.
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.emailAddress,
                cursorColor: maincolor,
                cursorHeight: 25.0,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    size: 25,
                  ),
                  // labelText: "Email address",
                  hintText: 'Email address',
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                  ),
                  fillColor: maincolor,
                  focusColor: maincolor,
                  hoverColor: maincolor,

                  errorStyle: GoogleFonts.ptSans(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
                validator: (value) {
                  // ignore: prefer_is_empty
                  if (value!.length > 0) {
                    if (!isEmailValid(value)) {
                      return "ex :- customer@xyz.xyz";
                    }
                  }
                  return null;
                },
                controller: _email,
              ),
              10.heightBox,

              SizedBox(
                height: 50,
                width: double.infinity,
                // constraints: const BoxConstraints(minWidth: 150.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    shadowColor: Colors.grey[600],
                    padding: const EdgeInsets.all(0.0),
                    primary: maincolor,
                    splashFactory: InkSplash.splashFactory,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () {
                    addData();
                  },
                  child: Text(
                    "Submit",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }

  addData() {
    if (_formKey.currentState!.validate()) {
      UserModel userModel = UserModel(_name.text, widget.phone, _email.text);
      CommonHelper().addUpdateUser(userModel);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
  }
}
