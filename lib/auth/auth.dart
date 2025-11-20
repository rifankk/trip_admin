import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_admin/navigationbar/bottomnav.dart';

class Authservice {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<String> signup({
    String? username,
    String? email,
    String? password,
  }) async {
    String res = "Some error occure";
    if (username!.isNotEmpty && email!.isNotEmpty && password!.isNotEmpty) {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore.collection("admin").doc(credential.user!.uid).set({
        'name': username,
        'email': email,
        'uid': credential.user!.uid,
      });
      // uuid
      var url = res = "success";
    } else {
      res = "please fill all the field";
    }
    try {} catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    String? userid;
    String? message;
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
            print("✅ Login successful!");
            userid = value.user?.uid;
            message = "Login Suucess";
            String uid = value.user!.uid;
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString("uid", uid);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNavBar()),
            );
            print(uid);
          });
    } on FirebaseAuthException catch (e) {
      print("❌ Firebase Auth error: ${e.code} - ${e.message}");
    } catch (e) {
      print("❌ General error: $e");
    }
  }
}
