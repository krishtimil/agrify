import 'package:agrify/ui/screens/plan_screen.dart';
import 'package:agrify/ui/utilities/colors.dart';
import 'package:agrify/ui/utilities/constant.dart';
import 'package:beautiful_ui_components/beautiful_ui_components.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class YardPlanningScreen extends StatefulWidget {
  const YardPlanningScreen({super.key});

  @override
  State<YardPlanningScreen> createState() => _YardPlanningScreenState();
}

class _YardPlanningScreenState extends State<YardPlanningScreen> {
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
    return Scaffold(
        backgroundColor: kPrimarySwatch,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  spacer(height: 30),
                  Text(
                    'plan your yard'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: kWhiteColor,
                    ),
                  ),
                  spacer(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Yards',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  spacer(height: 20),
                  const Text(
                    'Sorry! No yards planned yet',
                    style: TextStyle(color: Colors.white),
                  ),
                  spacer(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Plan Your Yard Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  spacer(height: 20),
                  TextInputField(
                    placeholder: 'Name Your Yard',
                    borderColor: kWhiteColor,
                    controller: _nameController,
                  ),
                  spacer(height: 10),
                  TextInputField(
                    placeholder: 'Width (In Yards)',
                    borderColor: kWhiteColor,
                    controller: _widthController,
                    keyboardType: TextInputType.number,
                  ),
                  spacer(height: 10),
                  TextInputField(
                    placeholder: 'Length (In Yards)',
                    borderColor: kWhiteColor,
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                  ),
                  spacer(height: 20),
                  FilledButton(
                      color: kWhiteColor,
                      text: 'Plan Now',
                      onTap: () {
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
                      },
                      textColor: kPrimarySwatch)
                ],
              ),
            ),
          ),
        ));
  }
}
