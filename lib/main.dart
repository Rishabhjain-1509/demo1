//Created By Rishabh Jain.
//Created On Jan 3, 2022

import 'package:demo/Services/core/store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Pages/LoginPhase/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPrefData.init();
  await Firebase.initializeApp();
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}
