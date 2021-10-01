// ! Created By DZ-TM071 Free Open Source Code !
import 'package:flutter/material.dart';
import 'package:user_gg/Pages/home.dart';

void main() {
  runApp(TinderClone());
}

class TinderClone extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      home: const Home(),
    );
  }
}
