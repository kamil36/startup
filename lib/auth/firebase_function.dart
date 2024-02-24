import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static saveUser(String firstname, lastname, email, password, uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password
    });
  }
}
