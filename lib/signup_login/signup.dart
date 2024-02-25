// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}



class _SignUpPageState extends State<SignUpPage> {
  bool isLoading = false;


final GlobalKey<FormState> _SignupformKey = GlobalKey<FormState>();

TextEditingController firstnameController= TextEditingController();
TextEditingController lastnameController= TextEditingController();
TextEditingController emailController= TextEditingController();
TextEditingController passwordController= TextEditingController();


createUserWithEmailAndPassword(context)async{
  try {
    setState(() {
    isLoading=true;
  });
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text.trim(),
    password: passwordController.text.trim(),
    
  );await FirebaseFirestore.instance.collection('users').add({
      'firstname': firstnameController,
      'lastname': lastnameController,
      'email': emailController,
      'password': passwordController,
    });

  setState(() {
    isLoading=false;
  });
  
} on FirebaseAuthException catch (e) {
    setState(() {
    isLoading=false;
  });
  if (e.code == 'weak-password') {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
  showCloseIcon: true,
  content: Text("The password provided is too weak.")));
  } else if (e.code == 'email-already-in-use') {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
  showCloseIcon: true,
  content: Text("The account already exists for that email.")));
  }
} catch (e) {
  setState(() {
    isLoading=false;
  });
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
  showCloseIcon: true,
  content: Text("Error:$e")));
}
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _SignupformKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                       
                             TextFormField(
                                key: ValueKey('firstname'),
                                decoration: InputDecoration(
                                  hintText: 'Enter First Name',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Fist Name';
                                  } else {
                                    return null;
                                  }
                                },
                               
                              ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          key: ValueKey('lastname'),
                          decoration: InputDecoration(
                            hintText: 'Enter Last Name',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Last Name';
                            } else {
                              return null;
                            }
                          },
                          
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          key: ValueKey('email'),
                          decoration: InputDecoration(
                            hintText: 'Enter a Email',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please Enter valid Email';
                            } else {
                              return null;
                            }
                          },
                        
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          key: ValueKey('password'),
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter a Password',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'Please Enter Password of min length 6';
                            } else {
                              return null;
                            }
                          },
                        
                        ),
                        SizedBox(
                          height: 10,
                        ),
                    
                        SizedBox(
                          height: 50,
                        ),
                        InkWell(
                         onTap: (){
                    if(_SignupformKey.currentState!.validate()){
                      createUserWithEmailAndPassword(context);
                    }
                  },
                          child: Container(
                            height: 60,
                            width: 250,
                            color: Colors.black,
                            child: Center(
                              child: isLoading?Center(child: CircularProgressIndicator()): Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
