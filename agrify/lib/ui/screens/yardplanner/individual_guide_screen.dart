import 'package:flutter/material.dart';

import '../../utilities/colors.dart';
import '../../utilities/constant.dart';
import '../../utilities/crops_dataset.dart';
import 'guide_screen.dart';

class IndividualGuideScreen extends StatelessWidget {
  IndividualGuideScreen({super.key, required this.crop});

  String crop = '';
  Map cropMap = cropDAta;

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
                IndividualCropContainer(
                  cropName: cropMap[crop]['cropname'],
                  fertilizer: cropMap[crop]['fertilizer'],
                  procedures: cropMap[crop]['procedure'],
                  season: cropMap[crop]['season'],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IndividualCropContainer extends StatefulWidget {
  IndividualCropContainer({
    Key? key,
    required this.cropName,
    required this.fertilizer,
    required this.procedures,
    required this.season,
  }) : super(key: key);

  final String cropName;
  final String season;
  final List procedures;
  final String fertilizer;

  @override
  State<IndividualCropContainer> createState() =>
      _IndividualCropContainerState();
}

class _IndividualCropContainerState extends State<IndividualCropContainer> {
  Set arr = {};

  loadTile() {
    for (var i = 0; i < widget.procedures.length; i++) {
      arr.add(
        ListTile(
          leading: Text((i + 1).toString()),
          title: Text(widget.procedures[i]),
        ),
      );
    }
  }

  @override
  void initState() {
    loadTile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                widget.cropName,
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Best Season - ${widget.season}',
                style: TextStyle(color: kWhiteColor),
              ),
            ],
          ),
          spacer(height: 10),
          ...arr.toList(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: loadTile(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
