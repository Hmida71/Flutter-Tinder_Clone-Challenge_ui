import 'package:flutter/material.dart';
import 'package:user_gg/Tinder/Pages/home.dart';
// import 'Pages/Home.dart';

// void main() {
//   runApp(TinderClone());
// }

// class TinderClone extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         bottomSheetTheme: const BottomSheetThemeData(
//           backgroundColor: Colors.white,
//         ),
//       ),
//       home: const RandomUser(),
//     );
//   }
// }

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
