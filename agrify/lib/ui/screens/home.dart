import 'package:agrify/ui/components/market_tile.dart';
import 'package:agrify/logic/controllers/auth_methods.dart';
import 'package:agrify/ui/components/weather_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utilities/colors.dart';
import '../utilities/constant.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool isLoggedIn = AuthMethods().authState;
  int currentIndex = 0;

  Widget setBottombarPage() {
    switch (currentIndex) {
      case 0:
        return HomePage(isLoggedIn: isLoggedIn);
        break;
      case 1:
        return Container( child: Text('Cart'),);
      case 2:
        return Container(child: Text('Weather'),);
      default:
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimarySwatch,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: kPrimarySwatch,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: kPrimarySwatch,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.cloudy_snowing,
                color: kPrimarySwatch,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.comment,
                color: kPrimarySwatch,
              ),
              label: '')
        ],
      ),
      body: SafeArea(
        child: setBottombarPage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.isLoggedIn,
  }) : super(key: key);

  final bool isLoggedIn;

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Hi, Jared!
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ${isLoggedIn ? "Nishant" : "Agriculturist!"}',
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
                      '23 Jan, 2021',
                      style: TextStyle(
                        color: kPrimarySwatch.shade100,
                      ),
                    )
                  ],
                ),
                //Notification
                Container(
                  decoration: BoxDecoration(
                    //color: kPrimarySwatch.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(12),
                  child: isLoggedIn
                      ? CircleAvatar()
                      : IconButton(
                          onPressed: () async {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          icon: const Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                        ),
                )
              ],
            ),

            SizedBox(
              height: 28,
            ),

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Weather Updates',
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

            SizedBox(
              height: 25,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    WeatherCard(
                      weatherFace: '🌧️',
                    ),
                    Text(
                      'Yesterday',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Rainy',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    WeatherCard(
                      weatherFace: '🌧️',
                    ),
                    Text(
                      'Today',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Rainy',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    WeatherCard(
                      weatherFace: '🌧️',
                    ),
                    Text(
                      'Tommorrow',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Rainy',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      SizedBox(
        height: 25,
      ),

      // weather

      Expanded(
        child: Container(
          padding: EdgeInsets.all(25),
          color: Colors.grey[100],
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'MarketPlace',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  spacer(height: 10),
                  MarketTile(),
                  MarketTile(),
                  MarketTile(),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
