import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

showToast(BuildContext context, String msg) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: msg.text.make()));
}

navigateWithReplacement(BuildContext context, dynamic to) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => to,
      ));
}

navigateWithWithoutReplacement(BuildContext context, dynamic to) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => to,
      ));
}

bool isEmailValid(String text) {
  String validString =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp red = RegExp(validString);

  return red.hasMatch(text);
}

List<TextEditingController> getControllerList(int count) {
  List<TextEditingController> controllers = [];
  for (var i = 0; i < count; i++) {
    controllers.add(TextEditingController());
  }
  return controllers;
}

sendOtp(String phone, Function callBack, Function verifyCallBack) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: '+91$phone',
    verificationCompleted: (PhoneAuthCredential credential) async {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        if (value.user != null) {
          callBack(value);
        }
      });
    },
    verificationFailed: (FirebaseAuthException e) {
      // ignore: avoid_print
      print(e.message);
    },
    codeAutoRetrievalTimeout: (verificationID) {
      verifyCallBack(verificationID);
    },
    timeout: const Duration(seconds: 120),
    codeSent: (String verificationId, int? forceResendingToken) {
      verifyCallBack(verificationId);
    },
  );
}

Future<dynamic> verifyOtp(
    String _verificationCode, String otpEntered, String phone) async {
  try {
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
            verificationId: _verificationCode, smsCode: otpEntered))
        .then(
      (value) async {
        return value;
      },
    );
    // ignore: empty_catches
  } catch (e) {}
  return {};
}

DocumentReference getUserDoc(String number) {
  return FirebaseFirestore.instance.collection('Users').doc(number);
}
