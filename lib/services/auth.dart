import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:untitled1/services/database.dart';

// import '../constants/colllection_names.dart';
import '../models/appUser.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final _userCollection = FirebaseFirestore.instance.collection(CollectionName.users);
  // late CollectionReference _userCollection;


  AppUser? _getUserProfile(User? user){
   return user != null ? AppUser(uid: user.uid) : null;
 }



//  auth change user stream
  Stream<AppUser?> get user {
   return _auth.authStateChanges()
       .map((User? user) =>  _getUserProfile(user));

  }

  // sign in Anonymously
  Future<AppUser?> signInAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User? userDetails = userCredential.user;
      return _getUserProfile(userDetails!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //register with email and password

  Future registerWithEmailAndPassword(String email, String password, String name) async {
   try{
     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
             email: email, password: password,
     );
     User? user = userCredential.user;
     await getUserProfile(user);     //create a new document for the user with the uid

     //create a new document for the user with the uid
     return _getUserProfile(user!);
   }catch(e){
     print("Sign up failed: $e");
     return null;
   }
  }

  //log in with email and password

  Future signInWithEmailAndPassword(String email, String password) async {
   try{
     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
             email: email, password: password,
     );
     User? user = userCredential.user;
     return _getUserProfile(user!);
   }catch(e){
     print("log in failed: $e");
     return null;
   }
  }


  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true; // Sign out successful
    } catch (e) {
      print("Error while signing out: $e");
      return false; // Sign out failed
    }
  }

  Future<void> updateUsername(String newUsername) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updateDisplayName(newUsername);
        // Update the username in your database or wherever you store user data
        // You might want to add error handling here
        await DatabaseService(uid: user.uid).updateUserData(name: newUsername); // Update the username in your database
      }
    } catch (e) {
      print('Error updating username: $e');
      // Handle error, show a message, etc.
    }
  }


  // Future signOut() async {
  //   bool signOutResult = await AuthService().signOut();
  //   if (signOutResult) {
  //     // Navigate to the LoginScreen after successful sign-out.
  //     Get.to(
  //         LoginPage(),
  //        );
  //   } else {
  //     // Handle sign-out failure here, if needed.
  //   }
  // }




// Sign out
//   Future signOut() async {
//
//     try {
//       await _auth.signOut();
//     } catch (e) {
//       print(e.toString());
//     }
//     return null;
//   }

  // Future<bool> signOut() async {
  //   bool _signOutSuccessful = false;
  //   try {
  //     await _auth.signOut();
  //     _signOutSuccessful = true;
  //    
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return _signOutSuccessful;
  // }

}


class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  // Update user data in the database, including the username
  Future<void> updateUserData({required String name}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users') // Update this to your collection name
          .doc(uid)
          .update({'username': name});
    } catch (e) {
      print('Error updating user data: $e');
    }
  }
}



