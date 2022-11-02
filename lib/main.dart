import 'package:flutter/material.dart';

import './ui/screens/login.dart';
import './ui/screens/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyLogin(),
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
    },
  ));
}
