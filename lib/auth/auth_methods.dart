import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/models/user_model.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentUser.uid).get();
    return model.User.fromsnap(snap);
  }

  Future<String> signupuser({
    required String email,
    required String username,
    required String password,
  }) async {
    String res = "Signup user error";

    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        //register the user

        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // ignore: avoid_print
        print(cred.user!.uid);

        //add user to database

        // model.User user1 =
        //     model.User(username: username, uid: cred.user!.uid, email: email);

        // await _firestore
        //     .collection('users')
        //     .doc(cred.user!.uid)
        //     .set(user1.tojson());

        res = "sucess";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginuser(
      {required String email, required String password}) async {
    String res = "login error";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            //ue can store the user cred
            email: email,
            password: password);
        res = "success";
      } else {
        res = "please enter all the fields";
      }
      // } on FirebaseAuthException catch (e) {
      //   if (e.code == "user-not-found") {
      //     print("Please create the user first");
      //   }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
