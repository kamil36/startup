import 'package:flutter/material.dart';
import 'package:start_up/signup_login/login.dart';
import 'package:start_up/signup_login/signup.dart';

class SignupLoginPage extends StatefulWidget {
  const SignupLoginPage({super.key});

  @override
  State<SignupLoginPage> createState() => _SignupLoginPageState();
}

class _SignupLoginPageState extends State<SignupLoginPage> {


bool islogin = false;

void togglePage(){
  setState(() {
    islogin=!islogin;
  });
}
  @override
  Widget build(BuildContext context) {
    if(islogin){
      return LoginMain();
    }else{
      return SignUpPage();
    }
   
  }
}
