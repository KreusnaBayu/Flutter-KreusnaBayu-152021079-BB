import 'package:flutter/material.dart';
import 'package:parkol/Login.dart';
import 'dart:async';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  bool isLoading = true;

  void initState() {
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      setState(() {
        isLoading = false;
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191D88),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300.0, // Adjust the width as needed
              height: 300.0, // Adjust the height as needed
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset(
                  'assets/logo2.png', // Replace 'your_image.png' with your actual image asset path
                ),
              ),
            ),
            SizedBox(height: 250), // Increase the spacing between image and loading animation
            if (isLoading)
              LoadingAnimationWidget.inkDrop(
                color: Color(0xffA9BB86),
                size: 50,
              ),
          ],
        ),
      ),
    );
  }
}
