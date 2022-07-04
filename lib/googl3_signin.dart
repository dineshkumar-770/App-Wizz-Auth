// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_auth_app/home_screen.dart';
import 'package:flutter_auth_app/obscreen3.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInProvider extends ChangeNotifier{
    final googleSignIn = GoogleSignIn();
    FirebaseAuth auth = FirebaseAuth.instance;

    GoogleSignInAccount? _user;

    GoogleSignInAccount get user => _user!;

    Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
       
      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential); 
      
      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
            print(result);
      }  // if result not null we simply call the MaterialpageRoute,
        // for go to the HomePage screen
    }
  }


}