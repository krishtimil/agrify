import 'package:flutter/material.dart';

import '../../utilities/colors.dart';
import '../../utilities/constant.dart';

class SaleTracker extends StatefulWidget {
  const SaleTracker({super.key});

  @override
  State<SaleTracker> createState() => _SaleTrackerState();
}

class _SaleTrackerState extends State<SaleTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimarySwatch,
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              spacer(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Sale Tracker',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Track Your Sales And Purchase',
                              style: TextStyle(
                                color: kPrimarySwatch.shade100,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                    spacer(height: 20),

                    //search bar
                    Container(
                      decoration: BoxDecoration(
                        color: kPrimarySwatch.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Search',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: double.infinity,
                color: kWhiteColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
