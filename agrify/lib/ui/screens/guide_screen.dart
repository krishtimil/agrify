import 'package:agrify/ui/screens/individual_guide_screen.dart';
import 'package:agrify/ui/utilities/colors.dart';
import 'package:agrify/ui/utilities/constant.dart';
import 'package:flutter/material.dart';

class GuideScreen extends StatefulWidget {
  GuideScreen({super.key, required this.crops});

  List crops = [];
  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
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
                      'Add Crops',
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
                            'Potato',
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
                          spacer(height: 20),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        IndividualGuideScreen(crop: 'Potato')),
                              );
                            },
                            child: ListTile(
                              title: Text(
                                'See More'.toUpperCase(),
                                style: const TextStyle(color: kWhiteColor),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: kWhiteColor,
                              ),
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
