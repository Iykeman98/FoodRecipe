import 'package:flutter/material.dart';
import 'package:untitled1/Screens/loginscreen.dart';
import 'package:untitled1/Screens/signupscreen.dart';

class Authenticate extends StatefulWidget {

  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
//toggle between authentication pages

bool showSignIn = true;
void toggleView(){
  setState(() {
    showSignIn = !showSignIn;
  });
}
  @override
  Widget build(BuildContext context) {

    if(showSignIn){
      return LoginPage(toggleView: toggleView);
    }else{
      return SignUpPage(toggleView: toggleView);
    }
  }
}
