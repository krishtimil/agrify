import 'package:flutter/material.dart';

import '../../utilities/colors.dart';
import '../../utilities/constant.dart';
import '../../utilities/crops_dataset.dart';

class IndividualGuideScreen extends StatelessWidget {
  IndividualGuideScreen({super.key, required this.crop});

  String crop = '';

  Map cropMap = cropDAta;

  loadData() {
    print(crop);
    return IndividualCropContainer(
        cropName: cropMap[crop.toLowerCase()]['cropname'],
        fertilizer: cropMap[crop.toLowerCase()]['fertilizer'],
        procedures: cropMap[crop.toLowerCase()]['procedures'],
        season: cropMap[crop.toLowerCase()]['season']);
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
                loadData()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IndividualCropContainer extends StatelessWidget {
  const IndividualCropContainer({
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
    for (var i = 0; i < procedures.length; i++) {
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
