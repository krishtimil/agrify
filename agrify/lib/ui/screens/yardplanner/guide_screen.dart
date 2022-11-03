import 'package:agrify/ui/utilities/crops_dataset.dart';
import 'package:flutter/material.dart';

import './individual_guide_screen.dart';
import '../../utilities/colors.dart';
import '../../utilities/constant.dart';

class GuideScreen extends StatefulWidget {
  GuideScreen({super.key, required this.crops});

  final List crops;
  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  Map cropMap = cropDAta;
  List arr = [];
  loadData() {
    widget.crops.forEach((element) {
      arr.add(ReusableCropContainer(cropName: cropMap[widget.crops[0]]['cropname'], fertilizer: cropMap[widget.crops[0]]['fertilizer'], procedures: cropMap[widget.crops[0]]['procedure'], season: cropMap[widget.crops[0]]['season']));
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

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
                ...arr
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReusableCropContainer extends StatelessWidget {
  const ReusableCropContainer({
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

  loadTile() {
    for (var i = 0;
        procedures.length < 3 ? i < procedures.length : i < 3;
        i++) {
      return ListTile(
        leading: Text((i + 1).toString()),
        title: Text(procedures[i]),
      );
    }
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
                cropName,
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Best Season - ${season}',
                style: TextStyle(color: kWhiteColor),
              ),
            ],
          ),
          spacer(height: 10),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: loadTile(),
              ),
              spacer(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => IndividualGuideScreen(crop: 'Potato')),
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
    );
  }
}
