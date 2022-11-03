import 'dart:typed_data';

import 'package:agrify/ui/screens/scanner/check_disease.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:beautiful_ui_components/beautiful_ui_components.dart';

import '../../utilities/colors.dart';
import '../../utilities/constant.dart';
import '../../utilities/image_picker.dart';
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

  Uint8List? _image;

  bool addedImage = false;

  pickImages() async {
    Uint8List image = await PickImages().pickImageFromGallery();
    setState(() {
      _image = image;
      addedImage = true;
    });
  }

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
                  'Disease Prediction',
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
                  'Predict the potential diseases with information of leaves.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kPrimarySwatch.shade100,
                  ),
                )
              ],
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
                        'Fill Up Your Info',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  spacer(height: 20),
                  TextInputField(
                      placeholder: 'Name of plant',
                      borderColor: kPrimarySwatch,
                      controller: _nameController),
                  spacer(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    width: double.infinity,
                    height: 200,
                    child: IconButton(
                      onPressed: pickImages,
                      icon: const Icon(
                        Icons.photo_camera_back_outlined,
                        size: 80,
                      ),
                    ),
                  ),
                  spacer(height: 20),
                  FilledButton(
                    color: kPrimarySwatch,
                    text: 'Check For Disease',
                    onTap: () {
                      if (_nameController.text.isNotEmpty && addedImage) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const CheckDisease()),
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
