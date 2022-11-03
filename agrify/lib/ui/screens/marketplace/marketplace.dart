import 'package:flutter/material.dart';

import '../../components/weather_card.dart';
import '../../utilities/constant.dart';
import '../../utilities/colors.dart';

class MarketPlace extends StatelessWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // grettings row
      spacer(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'Marketplace',
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
                      'Your Place to Sell/Buy',
                      style: TextStyle(
                        color: kPrimarySwatch.shade100,
                      ),
                    )
                  ],
                ),
              ],
            ),

            spacer(height: 20),

            //search bar
            Container(
              decoration: BoxDecoration(
                color: kPrimarySwatch.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 25,
            ),

            // weather
          ],
        ),
      ),

      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          color: Colors.grey[100],
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 200),
            children: [
              CartItemWidget(
                  url:
                      'https://th.bing.com/th/id/R.71e83aa43de7160fd0ec14ceb1038656?rik=i%2f3jgmAr6Yxo%2bQ&pid=ImgRaw&r=0&sres=1&sresct=1',
                  discountedPrice: '1200',
                  intialPrice: '1400',
                  title: 'DAP Fertilizer'),
              CartItemWidget(
                  url:
                      'https://th.bing.com/th/id/R.71e83aa43de7160fd0ec14ceb1038656?rik=i%2f3jgmAr6Yxo%2bQ&pid=ImgRaw&r=0&sres=1&sresct=1',
                  discountedPrice: '1200',
                  intialPrice: '1400',
                  title: 'DAP Fertilizer'),
              CartItemWidget(
                  url:
                      'https://th.bing.com/th/id/R.71e83aa43de7160fd0ec14ceb1038656?rik=i%2f3jgmAr6Yxo%2bQ&pid=ImgRaw&r=0&sres=1&sresct=1',
                  discountedPrice: '1200',
                  intialPrice: '1400',
                  title: 'DAP Fertilizer'),
              CartItemWidget(
                  url:
                      'https://th.bing.com/th/id/R.71e83aa43de7160fd0ec14ceb1038656?rik=i%2f3jgmAr6Yxo%2bQ&pid=ImgRaw&r=0&sres=1&sresct=1',
                  discountedPrice: '1200',
                  intialPrice: '1400',
                  title: 'DAP Fertilizer'),
            ],
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
          ),
        ),
      ),
    ]);
  }
}

class CartItemWidget extends StatelessWidget {
  const CartItemWidget(
      {Key? key,
      required this.url,
      required this.discountedPrice,
      required this.intialPrice,
      required this.title})
      : super(key: key);

  final String url;
  final String title;
  final String discountedPrice;
  final String intialPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      padding: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: kPrimarySwatch,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Image.network(
            'https://th.bing.com/th/id/R.71e83aa43de7160fd0ec14ceb1038656?rik=i%2f3jgmAr6Yxo%2bQ&pid=ImgRaw&r=0&sres=1&sresct=1',
            height: 120,
          ),
          Container(
            decoration: BoxDecoration(color: kPrimarySwatch),
            child: Column(
              children: [
                Text(
                  'DAP Fertilizer',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                spacer(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Rs. 1000',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Rs. 1250',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
