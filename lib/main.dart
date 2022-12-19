import 'package:fitness_appliction/home_screen/home_screen.dart';
import 'package:fitness_appliction/login_screen/login.dart';

import 'package:fitness_appliction/registration_screen/registration_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        '/home_screen': (context) => HomeScreen(),
        '/reg_screen': (context) => RegestrationScreen(),
        '/login_screen': (context) => LoginScreen()
      },
    );
  }
}
