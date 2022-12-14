import 'package:agrify/logic/controllers/auth_methods.dart';
import 'package:agrify/ui/utilities/crops_dataset.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:beautiful_ui_components/beautiful_ui_components.dart';
import '../../components/weather_card.dart';
import '../../utilities/constant.dart';
import '../../utilities/colors.dart';

class InfoPage extends StatelessWidget {
  InfoPage({Key? key}) : super(key: key);

  bool isLoggedIn = AuthMethods().authState;

  @override
  Widget build(BuildContext context) {
    Map cropText = cropDAta;
    List availableCrops = ['Potato', 'Tomato', 'Radish', 'Squash', 'Cabbage'];

    return Column(children: [
      // grettings row
      spacer(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  'Information Book',
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
                  'Your Place to Learn',
                  style: TextStyle(
                    color: kPrimarySwatch.shade100,
                  ),
                )
              ],
            ),
            spacer(height: 20),
          ],
        ),
      ),

      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
          color: Colors.grey[100],
          child: ListView.builder(
            itemCount: cropText.length,
            itemBuilder: (context, index) {
              return Tile(
                title: availableCrops[index],
                season: cropText[availableCrops[index]]['season'],
                fertilizer: cropText[availableCrops[index]]['fertilizer'],
                procedure: cropText[availableCrops[index]]['procedure'],
              );
            },
          ),
        ),
      ),
    ]);
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.title,
    required this.season,
    required this.fertilizer,
    required this.procedure,
  }) : super(key: key);

  final String title;
  final String season;
  final String fertilizer;
  final List procedure;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.all(10.0),
        title: Text(title),
        children: [
          spacer(height: 5),
          Row(
            children: [
              Text(
                'Appropriate Season: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${season}'),
            ],
          ),
          Wrap(
            children: [
              Text(
                'Fertilizer Use: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('${fertilizer}'),
            ],
          ),
          spacer(height: 5),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Procedure',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          BulletedList(
            listItems: procedure,
            listOrder: ListOrder.ordered,
            bulletType: BulletType.numbered,
          ),
        ],
      ),
    );
  }
}
