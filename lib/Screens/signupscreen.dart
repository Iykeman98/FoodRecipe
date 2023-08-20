
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/services/auth.dart';
import '../shared/loadingWidget.dart';



import 'homescreen.dart';

class SignUpPage extends StatefulWidget {

  final Function? toggleView;

  SignUpPage({ this.toggleView});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String name = "";
  String email = "";
  String password = "";
  String referral = "";
  String error ="";

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
                                borderRadius: BorderRadius.circular(10)
                            ),
                            height: 40,
                            width: 40,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(FontAwesomeIcons.xmark, color: Colors.black,),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 30,
                  child:
                  Text(
                    "Welcome Chef👩🏽‍🍳",
                    // maxLines: 2,
                    // overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),Text(
                    "Sign In",
                    // maxLines: 2,
                    // overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
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
                    borderRadius: BorderRadius.circular(20)
                  ),

                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val)=> val!.isEmpty ? "Enter an name" : null,
                          onChanged: (val){
                            setState(() {
                              name = val;
                            });
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            prefixIcon: Icon(FontAwesomeIcons.user,size: 16,),
                            prefixIconColor: Colors.grey,
                            hintText: "First and Last name",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (val)=> val!.isEmpty ? "Enter an email" : null,
                          onChanged: (val){
                            setState(() {
                              email = val;
                            });
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            prefixIcon: Icon(FontAwesomeIcons.envelope,size: 16,),
                            prefixIconColor: Colors.grey,
                            hintText: "JohnDoe123@gmail.com",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (val)=> val!.length < 8 ? "Enter a password ranging 8 character" : null,
                          onChanged: (val){
                            setState(() {
                              password = val;
                            });
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            label: Text(
                              "password",
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            suffixIcon: Icon(FontAwesomeIcons.eyeSlash, size: 16,),
                            prefixIcon: Icon(FontAwesomeIcons.key, size: 16,),
                            hintText: "* * * * * * * *",
                            prefixIconColor: Colors.grey,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (val){
                            setState(() {
                              referral = val;
                            });
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Referral Code (Optional)',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.orange),
                            ),
                            prefixIcon: Icon(FontAwesomeIcons.envelope,size: 16,),
                            prefixIconColor: Colors.grey,
                            hintText: 'Referral Code (Optional)',
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
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ), SizedBox(width: 5,),
                    GestureDetector(
                      onTap: ()=>  widget.toggleView!(),
                      child: Text(
                        "Log in",
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
                ),
                ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password, name);
                    if( result == null){
                      setState(() {
                        error = "please supply a valid email";
                        loading = false;
                      });
                    }else{

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
                      borderRadius: BorderRadius.circular(10.0), // Set the desired border radius
                    ),
                  ),

                  child: Center(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white,),
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
