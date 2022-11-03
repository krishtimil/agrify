import 'package:agrify/ui/screens/individual_guide_screen.dart';
import 'package:agrify/ui/utilities/colors.dart';
import 'package:agrify/ui/utilities/constant.dart';
import 'package:flutter/material.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Forum', style: TextStyle(fontSize: 20),),
        const Text('Ask and Answer Queries', style: TextStyle(fontSize: 16),),
        spacer(height: 20),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nishant Pokhrel',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Nov 3',
                          style: TextStyle(color: kWhiteColor),
                        ),
                      ],
                    ),
                    spacer(height: 10),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: ListTile(
                            title: Text('What are the best ways to plough fields?'),
                            subtitle: Text('I am stuck on how to plough the field correctly', style: TextStyle(color: kWhiteColor),),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      IndividualGuideScreen(crop: 'Potato')),
                            );
                          },
                          child: ListTile(
                            title: Text(
                              'replies'.toUpperCase(),
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
            },
          ),
        ),
      ],
    );
  }
}
