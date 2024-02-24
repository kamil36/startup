import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:start_up/auth/firebase_function.dart';

class AuthServices {
  static signupUser(String email, String password, String firstname,
      String lastname, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseAuth.instance.currentUser!.updateDisplayName(firstname);
      await FirebaseAuth.instance.currentUser!.updateDisplayName(lastname);
      await FirebaseAuth.instance.currentUser!.verifyBeforeUpdateEmail(email);
      await FirebaseAuth.instance.currentUser!.updatePassword(password);
      await FirestoreServices.saveUser(
          firstname, lastname, email, password, userCredential.user!.uid);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Signup Successfully'),
      ));
      Navigator.of(context).pushReplacementNamed('/login');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 1),
            content: Text('Password Provided is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 1),
            content: Text('This email is already Exists')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 3), content: Text(e.toString())));
    }
  }

  static signinUser(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 1), content: Text('You are Logged in')));
          Navigator.of(context).pushReplacementNamed('/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 1),
            content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 1),
            content: Text('Password did not match')));
      }
    }
  }
}
