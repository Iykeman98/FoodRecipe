// import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/wrapper.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: FlutterSplashScreen.gif(
            duration: Duration(milliseconds: 3000), defaultNextScreen: Wrapper(),
            gifPath: 'assets/nike.gif',
            gifWidth: 200,
            gifHeight: 100,
          )),
    );
  }
}
