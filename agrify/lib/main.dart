import 'package:agrify/ui/screens/home.dart';
import 'package:agrify/ui/utilities/font_style.dart';
import 'package:flutter/material.dart';
import 'package:agrify/ui/screens/login.dart';
import 'package:agrify/ui/screens/register.dart';

import './ui//screens/home2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: textTheme,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => MyHome(),
        'register': (context) => MyRegister(),
        'login': ((context) => MyLogin()),
      },
    );
  }
}
