// @dart=2.9

// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthClass {
  FirebaseAuth auth = FirebaseAuth.instance;

  //Create Account
  Future<String> createAccount({String email, String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password).then((value) async {
        User user = FirebaseAuth.instance.currentUser;
      });
      return "Account created";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return "Error occurred";
    }
  }

  //Sign in user
  Future<String> signIN({String email, String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Welcome";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
  }
  void signOut() {
    auth.signOut();
  }
  // final CollectionReference planName = FirebaseFirestore.instance.collection('plan');
  // Future<void> CreatePlan(String namePlan, String planPrice,String planDes,int planDur,String uid) async{
  //     return await planName.
  // }

}