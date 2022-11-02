import 'package:agrify/ui/utilities/colors.dart';
import 'package:agrify/ui/utilities/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              spacer(height: 20),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: kPrimarySwatch,
                      radius: 80,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 44,
                      ),
                    ),
                    Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt, color: Colors.white,),
                        ),
                      ),
                      bottom: 5,
                      right: 5,
                    )
                  ],
                ),
              ),
              spacer(height: 10),
              Text('Welcome Nishant Pokhrel', textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}
