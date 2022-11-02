import 'package:agrify/ui/utilities/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: kPrimarySwatch,
                ),
                child: Text('agrify - a revolution'.toUpperCase()),
              )
            ],
          ),
        ),
      ),
    );
  }
}