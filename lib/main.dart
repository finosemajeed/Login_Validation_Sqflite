import 'package:fitness_appliction/home_screen/home_screen.dart';
import 'package:fitness_appliction/login_screen/login_screen.dart';
import 'package:fitness_appliction/main_screen/main_screen.dart';
import 'package:fitness_appliction/registration_screen/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      routes: {
        '/home_scree': (context) => HomeScreen(),
        '/reg_screen': (context) => RegestrationScreen(),
        '/login': (context) => LoginScreen()
      },
    );
  }
}
