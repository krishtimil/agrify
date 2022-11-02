import 'package:agrify/ui/utilities/colors.dart';
import 'package:agrify/ui/utilities/constant.dart';
import 'package:flutter/material.dart';

class IndividualGuideScreen extends StatelessWidget {
  IndividualGuideScreen({super.key, required this.crop});

  String crop = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimarySwatch,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                spacer(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Detailed Information',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                spacer(height: 30),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            crop,
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Best Season - April/May',
                            style: TextStyle(color: kWhiteColor),
                          ),
                        ],
                      ),
                      spacer(height: 10),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              leading: Text('1'),
                              title: Text('Plough your field'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              leading: Text('2'),
                              title: Text('Plough your field'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              leading: Text('3'),
                              title: Text('Plough your field'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
