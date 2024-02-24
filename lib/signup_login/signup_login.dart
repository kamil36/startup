import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:start_up/pages/home.dart';
import 'package:start_up/signup_login/signup.dart';

class SignupLoginPage extends StatelessWidget {
  const SignupLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return SignUpPage();
          }
        },
      ),
    );
  }
}
