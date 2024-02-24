import 'package:flutter/material.dart';
import 'package:start_up/auth/auth_services.dart';
import 'package:start_up/signup_login/signup.dart';

class LoginMain extends StatefulWidget {
  @override
  State<LoginMain> createState() => _LoginMainState();
}

final GlobalKey<FormState> _loginformKey = GlobalKey<FormState>();

class _LoginMainState extends State<LoginMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _loginformKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      "assets/images/veg.png",
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height / 2.2,
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 350,

                
                child: TextFormField(
                  key: ValueKey('email'),
                  decoration: InputDecoration(
                      hintText: 'Enter Email',
                      contentPadding: EdgeInsets.only(top: 10, left: 10),
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
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
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                width: 350,
                child: TextFormField(
                  key: ValueKey('password'),
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Enter Password',
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      contentPadding: EdgeInsets.only(top: 10, left: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
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
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_loginformKey.currentState!.validate()) {
                      _loginformKey.currentState!.save();
                      login
                          ? AuthServices.signinUser(email, password, context)
                          : AuthServices.signupUser(
                              email, password, firstname, lastname, context);
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(350, 40),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  )),
              SizedBox(
                height: 05,
              ),
              const Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text("OR"),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Image.asset(
                          "assets/icons/google.png",
                          height: 30,
                        ),
                      ),
                      title: Text(
                        "Continue with Google",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have an account? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpPage();
                        }));
                      },
                      child: Text(
                        "Sign up.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: const Color.fromARGB(255, 60, 91, 107)),
                      ))
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
