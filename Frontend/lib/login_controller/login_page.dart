import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../responsive_files/desktop_main_layout.dart';

class LoginPage extends StatelessWidget {
  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  googleSignWith(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        // use the credential to sign in to Firebase
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final User? user = userCredential.user;

        String? name = user?.displayName;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Hello $name")),
        );

        // print();

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return const DesktopMainPage();
        }));
      } else {
        // handle sign-in failure
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign-in failed. Please try again later.')),
        );
      }
    } catch (e) {
      // handle sign-in error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-in failed. Please try again later.')),
      );
    }
  }
}
