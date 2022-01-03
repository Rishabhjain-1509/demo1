import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:demo/Constant/constant.dart';
import 'package:demo/Functions/functions_extra.dart';
import 'package:demo/Helper/common.dart';
import 'package:demo/Home/home.dart';
import 'package:demo/LoginPhase/form.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  final String refCode;

  const OTPScreen({Key? key, required this.phone, this.refCode = ""})
      : super(key: key);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _formKey = GlobalKey<FormState>();
  String _verificationCode = "";
  bool showOtp = false;
  String otpEntered = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            //Body of the Screen.
            child: Padding(
                padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          txtDesign("Verify Phone", 20.0, Colors.black,
                              FontWeight.bold),
                          const SizedBox(
                            height: 20.0,
                          ),
                          txtDesign("Code is sent to +91${widget.phone}", 17.0,
                              Colors.grey, FontWeight.bold),
                          const SizedBox(
                            height: 30.0,
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.grey,
                            cursorHeight: 25.0,

                            decoration: InputDecoration(
                              labelText: "Enter the Six Digit OTP",
                              filled: true,
                              fillColor: Colors.grey[100],
                              focusColor: Colors.grey,
                              hoverColor: Colors.grey,
                              prefixIcon: const Icon(
                                Icons.ac_unit,
                                color: Colors.grey,
                              ),
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
                                  color: Colors.grey),
                            ),

                            //Validate and check the input you given in the
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text !';
                              } else if (value.length > 6 || value.length < 6) {
                                return 'Please enter the 6 digit OTP !';
                              } else {
                                otpEntered = value;
                              }
                            },
                            onChanged: (value) {
                              if (value.length == 6 && value.isNotEmpty) {
                                _verifyOtp(context);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () => _verifyOtp(context),
                            child: Text(
                              "Verify",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                fontSize: 22.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent[700],
                              minimumSize: const Size(double.infinity, 50.0),
                              elevation: 3,
                              shadowColor: Colors.grey[600],
                              padding: const EdgeInsets.all(0.0),
                              splashFactory: InkSplash.splashFactory,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              txtDesign('Didn\'t receive code? ', 15.0,
                                  Colors.grey, FontWeight.bold),
                              txtDesign('Request again', 15.0, Colors.black,
                                  FontWeight.bold),
                            ],
                          ),
                          Text("Resend otp in $timeLeft"),
                          showResendOtp
                              ? InkWell(
                                  child: const Text("Resend otp"),
                                  onTap: () {
                                    _verifyPhone();
                                  },
                                )
                              : const SizedBox(),
                        ],
                      )
                    ]))));
  }

  bool isPlaying = true;
  int timeLeft = 120;
  late Timer _timer;
  bool showResendOtp = false;
  void timer() async {
    const sec = Duration(seconds: 1);
    _timer = Timer.periodic(
      sec,
      (Timer timer) {
        if (timeLeft == 0) {
          setState(() {
            cancelTimer();
            showResendOtp = true;
          });
        } else {
          setState(() {
            timeLeft--;
          });
        }
      },
    );
  }

  void cancelTimer() {
    _timer.cancel();
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  _verifyOtp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if (_verificationCode != "") {
        ProgressDialog pd = ProgressDialog(context: context);
        pd.show(max: 100, msg: pleaseWait);
        var data = await verifyOtp(_verificationCode, otpEntered, widget.phone);
        pd.close();
        checkAndSend(data);
      } else {
        showToast(context, "OTP not sent ,try again");
      }
    }
  }

  checkAndSend(dynamic data) async {
    if (data != null) {
      ProgressDialog pd = ProgressDialog(context: context);
      pd.show(max: 100, msg: pleaseWait);
      int resp = await CommonHelper().getCompleteUserData(widget.phone);
      // ignore: avoid_print
      print("i value is $resp");
      if (pd.isOpen()) {
        pd.close();
      }
      if (resp == 1) {
        navigateWithReplacement(context, const HomeScreen());
      } else {
        navigateWithReplacement(
            context, FormScreen(phone: widget.phone, refCode: ""));
      }
    } else {
      showToast(context, "OTP not matched");
    }
  }

  _verifyPhone() async {
    sendOtp(widget.phone, checkAndSend, verificationCallback);
  }

  verificationCallback(String code) {
    _verificationCode = code;
  }

  @override
  void initState() {
    // ignore: todo
    super.initState();
    _verifyPhone();
    timer();
  }
}
