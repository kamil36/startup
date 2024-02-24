import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_up/firebase_options.dart';
import 'package:start_up/models/imagelist.dart';
import 'package:start_up/pages/cart.dart';
import 'package:start_up/pages/home.dart';
import 'package:start_up/signup_login/login.dart';
import 'package:start_up/signup_login/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartAdd>(
      create: (context) => CartAdd(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme:
                AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: '/login',
          routes: {
            '/home': (context) => Home(),
            '/login': (context) => LoginMain(),
            '/cart': (context) => CartPage(),
            '/signup': (context) => SignUpPage(),
          }),
    );
  }
}
