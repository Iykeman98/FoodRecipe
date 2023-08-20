import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


// Future<void> updateUserData(String displayName, String displayEmail) async{
//   CollectionReference user = FirebaseFirestore.instance.collection("users");
//   FirebaseAuth auth = FirebaseAuth.instance;
//   String? uid = auth.currentUser?.uid.toString();
//   user.add({
//     'displayName': displayName,
//     'uid': uid,
//     "email": displayEmail,
//   });
// }

Future<void> getUserProfile(User? user) async{
  FirebaseFirestore.instance.collection('users')
      .doc(user?.email)
      .set({
    "email":user?.email,
    "name":user?.displayName,
    "time":user?.phoneNumber,
  });
  print('...saved user details...');
}







 // class DatabaseService{
 //
 //   final String? uid;
 //   DatabaseService({this.uid});
 //
 //   // collection reference
 //   final CollectionReference foodCollection = FirebaseFirestore.instance.collection('foods');
 //
 //   Future update(String foodName, String foodRecipe, String foodOrigin) async{
 //     return await foodCollection.doc(uid).set({
 //       'foodName': foodName,
 //       'foodRecipe': foodRecipe,
 //       'foodOrigin': foodOrigin,
 //     });
 //
 //   }
 // }