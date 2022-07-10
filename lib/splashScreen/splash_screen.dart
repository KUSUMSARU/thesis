import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rentomatic_app/mainScreen/main_screen.dart';

class MySplashScreen extends StatefulWidget {
  MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 25), () async {
      //send user to home screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (c) => MainScreen()),
      );
    });
    //send user to home screen
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png"),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Rentomatic",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )));
  }
}
