import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../services/auth.dart';
import '../shared/loadingWidget.dart';
import 'homescreen.dart';

class LoginPage extends StatefulWidget {

  final Function? toggleView;

  LoginPage({this.toggleView});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Accessing the AuthService class, it needs to be defined inside the widget
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  // create states to store textFormField info
  String email = "";
  String password = "";
  String error = "";

  //toggle password eye icon

  bool _isFirstIcon = true;
  void _toggleIcon() {
    setState(() {
      _isFirstIcon = !_isFirstIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/food3.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 20, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[600],
                                borderRadius: BorderRadius.circular(10)),
                            height: 40,
                            width: 40,

                            child: IconButton(
                                onPressed: () async{
                                  await _auth.signOut();
                              },
                              icon: Icon(
                                FontAwesomeIcons.xmark,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 130,
                ),
                Container(
                  width: 30,
                  child: Text(
                    "Welcome back🧑🏽‍🍳",
                    // maxLines: 2,
                    // overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Login text should be inserted inside here, thank u loyal admin!",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(20)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val)=> val!.isEmpty ? "Enter an email" : null,
                          onChanged: (val){
                            setState(() {
                              email = val;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            prefixIcon: Icon(
                              FontAwesomeIcons.envelope,
                              size: 16,
                            ),
                            prefixIconColor: Colors.grey,
                            hintText: "JohnDoe123@gmail.com",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (val)=> val!.length < 8 ? "Enter a password ranging 8 character" : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          decoration: InputDecoration(
                            label: Text(
                              "password",
                            ),
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: _toggleIcon,
                              child: _isFirstIcon
                                  ? Icon(
                                      FontAwesomeIcons.eyeSlash,
                                      size: 16,
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      FontAwesomeIcons.eye,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                            ),
                            prefixIcon: Icon(
                              FontAwesomeIcons.key,
                              size: 16,
                            ),
                            hintText: "* * * * * * * *",
                            prefixIconColor: Colors.grey,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Forgot Password',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 110,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't, have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),SizedBox(width: 5,),
                    GestureDetector(
                      onTap: ()=> widget.toggleView!(),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 14,
                ),Center(
                  child: SizedBox(
                      height: 14,
                      child: Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      )
                  ),
                ), SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if( result == null){
                        setState(() {
                          error = "please supply a valid credentials";
                          loading= false;
                        });
                      }else{
                        print("Singing now... hold");
                        // Navigate to the HomeScreen after successful registration.
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Set the desired border radius
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
