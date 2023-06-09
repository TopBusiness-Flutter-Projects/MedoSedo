import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'dart:convert';
class GoogleSignInProvider with ChangeNotifier {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  late GoogleSignInAccount googleAccount;
 late GoogleSignInAuthentication auth;

  Future<void> login() async {
    this.googleAccount = (await _googleSignIn.signIn())!;
    auth = await googleAccount.authentication;
    notifyListeners();
  }

  logout() async {
    this.googleAccount = (await _googleSignIn.signOut())!;
    notifyListeners();
  }
}
