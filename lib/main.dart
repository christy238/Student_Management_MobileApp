import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_management/View/Screens/Login_Section/Login_Page.dart';
import 'package:student_management/View/Screens/Login_Section/Welcom_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: 'Welcome',
      debugShowCheckedModeBanner: false,
      home: Welcome_Page(),
      routes: {
        '/student': (context) => const LoginPage(),
        '/teacher': (context) => const LoginPage(),
      },
    );
  }
}
