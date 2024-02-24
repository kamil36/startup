// ignore_for_file: avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.blueAccent,
        child: ListView(
          padding: EdgeInsets.all(5),
          children: [
            Container(
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                accountName: Text(
                  "Kamil Bombe",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("kamilbombe855@gmail.com"),
                currentAccountPictureSize: Size.square(40),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "K",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text(' My Profile '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.store),
                title: const Text(' My Store '),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, "/login");
                },
              ),
            ),
          ],
        ));
  }
}
