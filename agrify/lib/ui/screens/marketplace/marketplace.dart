import 'package:agrify/logic/controllers/auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:beautiful_ui_components/beautiful_ui_components.dart';
import '../../components/weather_card.dart';
import '../../utilities/constant.dart';
import '../../utilities/colors.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  bool isLoggedIn = AuthMethods().authState;

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

            spacer(height: 25),
            isLoggedIn
                ? Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 15),
                    child: FilledButton(
                      color: kWhiteColor,
                      onTap: () {},
                      text: 'Post Your Ad',
                      textColor: kPrimarySwatch,
                    ),
                  )
                : SizedBox(),
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
                      'https://nepalgramodhyog.store/images/products/Sabjiland%20chocolaty%20apple.png',
                  discountedPrice: '200',
                  intialPrice: '400',
                  title: 'Apple'),
              CartItemWidget(
                  url:
                      'https://www.jbmpackaging.com/wp-content/uploads/2018/09/RetailSeedPackets.png',
                  discountedPrice: '349',
                  intialPrice: '499',
                  title: 'Seeds'),
              CartItemWidget(
                  url:
                      'https://banner2.cleanpng.com/20180314/ulq/kisspng-insecticide-mosquito-aerosol-spray-bottle-insecticide-spray-bottle-5aa9954103ef49.8461730915210632330162.jpg',
                  discountedPrice: '999',
                  intialPrice: '1350',
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
        color: kPrimarySwatch.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Image.network(
            url,
            height: 120,
          ),
          Container(
            //decoration: BoxDecoration(color: kPrimarySwatch),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                spacer(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Rs. ${discountedPrice}',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text(
                      'Rs.${intialPrice}',
                      style: TextStyle(
                          color: Colors.red,
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
