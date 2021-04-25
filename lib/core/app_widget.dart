import 'package:devquiz/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      color: Colors.deepPurple,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
