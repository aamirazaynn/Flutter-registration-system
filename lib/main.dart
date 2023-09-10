import 'package:assignment3/screens/forgetPass.dart';
import 'package:assignment3/screens/home.dart';
import 'package:assignment3/screens/login.dart';
import 'package:assignment3/screens/registration.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        registation.id: (context) => registation(),
        login.id : (context) => login(),
        home.id : (context) => home(),
        forgetPass.id : (context) => forgetPass(),
      },
      
      initialRoute: registation.id,
      debugShowCheckedModeBanner: false,
    );
  }
}