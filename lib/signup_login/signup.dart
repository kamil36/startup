import 'package:flutter/material.dart';
import 'package:start_up/auth/auth_services.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

final GlobalKey<FormState> _SignupformKey = GlobalKey<FormState>();

String email = '';
String password = '';
String firstname = '';
String lastname = '';

bool login = false;

class _SignUpPageState extends State<SignUpPage> {
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
                        login
                            ? Container()
                            : TextFormField(
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
                                onSaved: (value) {
                                  setState(() {
                                    firstname = value!;
                                  });
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
                          onSaved: (value) {
                            setState(() {
                              lastname = value!;
                            });
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
                          onSaved: (value) {
                            setState(() {
                              email = value!;
                            });
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
                          onSaved: (value) {
                            setState(() {
                              password = value!;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       "Already member?",
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.w500,
                        //         fontSize: 18,
                        //       ),
                        //     ),
                        //     TextButton(
                        //       onPressed: () {
                        //         Navigator.pushNamed(context, "/login");
                        //       },
                        //       child: Text(
                        //         "Log In",
                        //         style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 22,
                        //             color: Colors.blueAccent),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_SignupformKey.currentState!.validate()) {
                              _SignupformKey.currentState!.save();
                              login
                                  ? AuthServices.signinUser(
                                      email, password, context)
                                  : AuthServices.signupUser(email, password,
                                      firstname, lastname, context);
                            }
                          },
                          child: Container(
                            height: 60,
                            width: 250,
                            color: Colors.black,
                            child: Center(
                              child: Text(
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
