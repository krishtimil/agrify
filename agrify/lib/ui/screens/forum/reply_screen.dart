import 'package:beautiful_ui_components/beautiful_ui_components.dart';
import 'package:flutter/material.dart';

import '../../utilities/colors.dart';
import '../../utilities/constant.dart';
import '../../utilities/crops_dataset.dart';

class ReplyScreen extends StatelessWidget {
  ReplyScreen({super.key, required this.postTitle});

  String postTitle = '';

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
                  cropName: '',
                  fertilizer: '',
                  procedures: [postTitle],
                  season: '',
                ),
                spacer(height: 20),
                FilledButton(color: kWhiteColor, text: 'Add Response', onTap: (){}, textColor: kPrimarySwatch)
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
          title: Text(
            widget.procedures[i],
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
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
                '${widget.season}',
                style: TextStyle(color: kWhiteColor),
              ),
            ],
          ),
          spacer(height: 10),
          ...arr.toList(),
          spacer(height: 15),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Responses',
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          spacer(height: 15),
          ListTile(
            leading: Text('1', style: TextStyle(color: kWhiteColor)),
            title: Text(
              'Hey, Please Hire a tractor and accelerate them all over your field to plough your field the best way. Otherwise, you can use a mechanical plough too. It just takes a little effort',
              style: TextStyle(color: kWhiteColor),
            ),
            subtitle: Text('Response by Sushil Adhikari'),
          ),
          spacer(height: 15),
          ListTile(
            leading: Text('2', style: TextStyle(color: kWhiteColor),),
            title: Text(
              'Hey, Please get a plough and use them all over your field to plough your field the best way. Otherwise, you can use a  tractor too. It just takes a little less effort',
              style: TextStyle(color: kWhiteColor),
            ),
            subtitle: Text('Response by Aman Limbu'),
          ),
        ],
      ),
    );
  }
}
