import 'package:agrify/logic/training/disease_model.dart';
import 'package:agrify/model/disease/data_model.dart';
import 'package:agrify/ui/utilities/constant.dart';
import 'package:beautiful_ui_components/beautiful_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utilities/colors.dart';

class CheckDisease extends StatelessWidget {
  const CheckDisease({super.key, this.plantName = '', this.image});

  final String plantName;
  final Uint8List? image;

  @override
  Widget build(BuildContext context) {
    final DataModel _disease =
        DiseaseModel().recognizeDisease(plantName, image);
    return Scaffold(
      backgroundColor: kPrimarySwatch,
      body: SafeArea(
        child: Column(
          children: [
            spacer(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _disease.diseaseName!.toLowerCase() == 'healthy'
                          ? Text(
                              'No Disease Detected',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              'Disease Detected!',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      SizedBox(
                        height: 8,
                      ),
                      _disease.diseaseName!.toLowerCase() == 'healthy'
                          ? Text(
                              'Your Plant is absolutely Healthy',
                              style: TextStyle(
                                color: kPrimarySwatch.shade100,
                              ),
                            )
                          : Text(
                              'It looks like your plant is infected with a disease.',
                              style: TextStyle(
                                color: Colors.red.shade100,
                              ),
                            )
                    ],
                  ),
                  spacer(height: 20),
                  _disease.diseaseName!.toLowerCase() == 'healthy'
                      ? spacer()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Name : ${_disease.diseaseName}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                  spacer(height: 20),
                  _disease.diseaseName!.toLowerCase() == 'healthy'
                      ? spacer()
                      : Text(
                          'This is the most common disease that is prevalent in tomatoes'),
                  spacer(height: 30),
                ],
              ),
            ),
            _disease.diseaseName!.toLowerCase() == 'healthy'
                ? spacer()
                : Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                      color: kWhiteColor,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            spacer(height: 20),
                            ExpansionTile(
                              initiallyExpanded: true,
                              title: Text('Cause'),
                              children: [
                                ListTile(
                                  title: Text(
                                    'Lack Of Chlorophyll',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    'High Amount of Potassium',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              initiallyExpanded: false,
                              title: Text('Solution'),
                              children: [
                                ListTile(
                                  title: Text(
                                    'Expose to sunlight',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    'Reduce Potassium',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              initiallyExpanded: false,
                              title: Text('Prevention'),
                              children: [
                                ListTile(
                                  title: Text(
                                    'Avoid Over Usage Of Fertilizers',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    'Use fertilizers in limit',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            spacer(height: 20),
                            FilledButton(
                                color: kPrimarySwatch,
                                text: 'Consult A Expert',
                                onTap: () {},
                                textColor: kWhiteColor)
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
