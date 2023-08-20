import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/models/appUser.dart';
import 'package:untitled1/services/auth.dart';
import 'package:untitled1/services/favorite_provider.dart';
import 'Screens/splashScreen.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // Set the status bar color to transparent
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Use MultiProvider to wrap multiple providers
      providers: [
        // Provide the AppUser stream from AuthService
        StreamProvider<AppUser?>.value(
          value: AuthService().user,
          initialData: null,
        ),
        // Provide the FavoriteProvider
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
      ],
      child: GetMaterialApp(
        title: 'Task Manager',
        home:SplashScreen(),
      ),
    );
  }
}