import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      clipBehavior: Clip.none,
      autocorrect: true,
      autofocus: false,
      cursorColor: Colors.black,
      cursorHeight: 30,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.only(bottom: 0),
        fillColor: Color.fromARGB(255, 255, 255, 255),
        hintText: "  Search what do you want to product ",
        hintStyle: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.black,
          height: 2.5,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(color: Colors.black)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          borderSide: BorderSide(color: Colors.black),
        ),
        prefixIcon: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(224, 224, 224, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )),
            child: IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: Icon(Icons.search),
            )),
      ),
    );
  }
}
