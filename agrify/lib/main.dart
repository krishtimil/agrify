import 'package:agrify/ui/screens/tracker/tracker.dart';

import 'ui/screens/yardplanner/yard_planner.dart';
import 'package:agrify/ui/utilities/font_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './ui/screens/404.dart';
import './ui/screens/home.dart';
import './ui/screens/login/profile.dart';
import './ui/screens/login/login.dart';
import './ui/screens/login/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: '/home',
      routes: {
        '/register': (context) => const MyRegister(),
        '/login': ((context) => const MyLogin()),
        '/home': (context) => const MyHome(),
        '/404': (context) => const NotFoundScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/yard': (context) => const YardPlanner(),
        '/tracker': (context) => SaleTracker()
      },
      onUnknownRoute: (settings) {
        Navigator.pushNamed(context, '/404');
      },
    );
  }
}
