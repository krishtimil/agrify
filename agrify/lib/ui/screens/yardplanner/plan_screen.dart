import 'package:agrify/logic/controllers/auth_methods.dart';
import 'package:agrify/logic/controllers/firestore_methods.dart';
import 'package:beautiful_ui_components/beautiful_ui_components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import './guide_screen.dart';
import '../../utilities/colors.dart';
import '../../utilities/constant.dart';

class PlanScreen extends StatefulWidget {
  PlanScreen(
      {super.key,
      required this.name,
      required this.length,
      required this.width});

  String? name;
  double? width;
  double? length;

  @override
  State<PlanScreen> createState() => PlanScreenState();
}

class PlanScreenState extends State<PlanScreen> {
  List plannedCrops = [];
  List availableCrops = ['Potato', 'Tomato', 'Radish', 'Squash', 'Cabbage'];

  final _firestoreMethods = FirestoreMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Planned Crops',
                      style: TextStyle(
                        color: kPrimarySwatch,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                spacer(height: 20),
                plannedCrops.isNotEmpty
                    ?
                    Column(
                        children: plannedCrops
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  tileColor: kPrimarySwatch,
                                  leading: Text(
                                    e,
                                    style: const TextStyle(color: kWhiteColor),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          plannedCrops.remove(e);
                                          availableCrops.add(e);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        color: kWhiteColor,
                                      )),
                                ),
                              ),
                            )
                            .toList(),
                    )
                    : Text(
                        'You haven\'t planned any crops yet. Start By Adding '),
                spacer(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Crops',
                      style: TextStyle(
                        color: kPrimarySwatch,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                spacer(height: 20),
                availableCrops.isNotEmpty
                    ? Column(
                        children: availableCrops
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  tileColor: kPrimarySwatch,
                                  leading: Text(
                                    e,
                                    style: TextStyle(color: kWhiteColor),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          availableCrops.remove(e);
                                          plannedCrops.add(e);
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: kWhiteColor,
                                      )),
                                ),
                              ),
                            )
                            .toList(),
                      )
                    : Text(
                        'It looks like you have added all the crops',
                        textAlign: TextAlign.left,
                      ),
                spacer(height: 30),
                FilledButton(
                  color: kPrimarySwatch,
                  text: 'Add',
                  onTap: () async {
                    if (plannedCrops.isNotEmpty) {
                      await _firestoreMethods.setYards(
                        name: widget.name!,
                        width: widget.width!,
                        length: widget.length!,
                        items: plannedCrops,
                        uid: AuthMethods().gerUserId,
                      );
                      showSnackbar('Yard Successfully Planned', context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) =>
                              GuideScreen(crops: plannedCrops)),
                        ),
                      );
                    } else {
                      showSnackbar(
                          'Please add some crops to continue', context);
                    }
                  },
                  textColor: kWhiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
