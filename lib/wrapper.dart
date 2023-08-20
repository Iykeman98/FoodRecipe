import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/Screens/homescreen.dart';
import 'package:untitled1/models/appUser.dart';
import 'Screens/authenticate.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AppUser?>(context);

    if (user == null){
      return Authenticate();
    }else{
      return HomeScreen();
    }
  }
}
