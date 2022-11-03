import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:beautiful_ui_components/beautiful_ui_components.dart';

import '../../utilities/colors.dart';
import '../../utilities/constant.dart';
import '../yardplanner/guide_screen.dart';
import '../yardplanner/plan_screen.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  late TextEditingController _widthController;

  late TextEditingController _heightController;

  late TextEditingController _nameController;

  @override
  void initState() {
    _widthController = TextEditingController();
    _heightController = TextEditingController();
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _widthController.dispose();
    _heightController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // grettings row
      spacer(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Yard Planner',
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
                  'Plan your field.',
                  style: TextStyle(
                    color: kPrimarySwatch.shade100,
                  ),
                )
              ],
            ),
            spacer(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'My Yards',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            spacer(height: 20),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('yards').snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  var snapData = snapshot.data!.docs;

                  return Column(
                    children: snapData
                        .map(
                          ((e) => ListTile(
                                title: Text(e.get('name')),
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) => GuideScreen(
                                              crops: e.get('items'),
                                            )),
                                      ),
                                    );
                                  },
                                ),
                              )),
                        )
                        .toList(),
                  );
                }
                return const Text(
                  'Sorry! No yards planned yet',
                  style: TextStyle(color: Colors.white),
                );
              }),
            ),
            spacer(height: 30),
          ],
        ),
      ),

      Expanded(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 600,
              padding: EdgeInsets.symmetric(horizontal: 25),
              color: Colors.grey[100],
              child: Column(
                children: [
                  spacer(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Plan Your Yard Now',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  spacer(height: 20),
                  TextInputField(
                    placeholder: 'Name Your Yard',
                    borderColor: Colors.black,
                    controller: _nameController,
                  ),
                  spacer(height: 10),
                  TextInputField(
                    placeholder: 'Width (In Yards)',
                    borderColor: Colors.black,
                    controller: _widthController,
                    keyboardType: TextInputType.number,
                  ),
                  spacer(height: 10),
                  TextInputField(
                    placeholder: 'Length (In Yards)',
                    borderColor: Colors.black,
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                  ),
                  spacer(height: 20),
                  FilledButton(
                    color: kPrimarySwatch,
                    text: 'Plan Now',
                    onTap: () {
                      if (_nameController.text.isNotEmpty &&
                          _widthController.text.isNotEmpty &&
                          _heightController.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => PlanScreen(
                                  name: _nameController.text,
                                  length: double.parse(_heightController.text),
                                  width: double.parse(_widthController.text),
                                )),
                          ),
                        );
                      } else {
                        showSnackbar(
                            'All the fields are mandatory. keep none empty',
                            context);
                      }
                    },
                    textColor: kWhiteColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
