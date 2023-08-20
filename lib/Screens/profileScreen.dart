import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../refactored_widgets/largeBottomButton.dart';
import '../services/auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _updateUsername() async {
    final newUsername = _usernameController.text.trim();

    if (newUsername.isNotEmpty) {
      // Update the username in the AuthService
      AuthService authService = AuthService();
      await authService.updateUsername(newUsername);

      // Show a confirmation message or navigate back to the profile screen
      Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard when tapped outside of a text field
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () async {
                            Get.back();
                          },
                          color: Colors.deepOrange,
                          icon: Icon(
                            FontAwesomeIcons.leftLong,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/Guser.jpg"),
                      radius: 45,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () async {
                          },
                          color: Colors.deepOrange,
                          icon: Icon(
                            FontAwesomeIcons.checkDouble,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                ),
              ),
              SizedBox(height: 10,), LargeBottomButton(
                function: _updateUsername,
                  text: "Upload",
                  color: Colors.deepOrange)
            ],
          ),
        ),
      ),
    );
  }
}
