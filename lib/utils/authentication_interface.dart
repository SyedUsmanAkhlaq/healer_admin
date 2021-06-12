import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:healer_admin_panel/controllers/authentication_controller.dart';

/// Created by Usman Akhlaq on 09.06.2021
/// Copyright © 2021 Syed Usman All rights reserved.
/// Email: uakhlaq88@gmail.com

class AuthenticationInterface {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<bool> createAccount(String email, String password) async {
    print(email);
    print(password);
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.find<AuthenticationController>().firebaseUserID =
          _auth.currentUser!.uid;
      return true;
    } catch (e, s) {
      print("Authentication Interface: $e: $s");
      return false;
    }
  }

  static Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.find<AuthenticationController>().firebaseUserID =
          _auth.currentUser!.uid;
      return true;
    } catch (e, s) {
      print('$e, $s');
      return false;
    }
  }
}
