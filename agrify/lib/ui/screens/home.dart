import 'package:agrify/ui/components/market_tile.dart';
import 'package:agrify/logic/controllers/auth_methods.dart';
import 'package:agrify/ui/components/weather_card.dart';
import 'package:agrify/ui/screens/forum/forum_screen.dart';
import 'package:agrify/ui/screens/infobook/infomation_page.dart';
import 'package:agrify/ui/screens/marketplace/marketplace.dart';
import 'package:agrify/ui/screens/yardplanner/yard_planner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'weather/weather_page.dart';
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
        return HomePage(
          isLoggedIn: isLoggedIn,
        );
      case 1:
        return InfoPage();
      case 2:
        return YardPlanner();
      case 3:
        return ForumScreen();
      case 4:
        return WeatherPage();
      case 5:
        return Container(
          child: Text('Cart'),
        );
      case 6:
        return Container(
          child: Text('Scanner'),
        );
      default:
    }
    return ForumScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimarySwatch,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          setState(() {
            currentIndex = 6;
          });
        },
        child: Icon(Icons.camera_alt_outlined),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Material(
                child: Center(
                  child: InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home_filled),
                        //Text("Home"),
                        //const Padding(padding: EdgeInsets.all(10))
                      ],
                    ),
                  ),
                ),
              ),
              Material(
                child: Center(
                  child: InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.book),
                        //Text("Grupos"),
                        //const Padding(padding: EdgeInsets.only(left: 10))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(), //to make space for the floating button
              Material(
                child: Center(
                  child: InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.poll),
                          //Text("Completadas"),
                          //const Padding(padding: EdgeInsets.only(right: 10))
                        ],
                      )),
                ),
              ),
              Material(
                child: Center(
                  child: InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        currentIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.comment),
                        //Text("Perfil")
                        //const Padding(padding: EdgeInsets.only(left: 10))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: setBottombarPage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final bool isLoggedIn;

  const HomePage({
    Key? key,
    required this.isLoggedIn,
  }) : super(key: key);

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
                      'Namaste, ${isLoggedIn ? "Nishant" : "Agriculturist!"}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      DateFormat.yMMMd().format(DateTime.now()),
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
                      ? GestureDetector(
                          child: CircleAvatar(),
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.pushReplacementNamed(context, '/login');
                          })
                      : IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          icon: const Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                        ),
                ),
              ],
            ),

            spacer(height: 28),
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

            spacer(
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
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
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
                      weatherFace: '☁️',
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
                      'Cloudy',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    WeatherCard(
                      weatherFace: '☀️',
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
                      'Sunny',
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

      Container(
        margin: EdgeInsets.all(25),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.red,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Alert! Hailstone Tomorrow!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            Icon(
              Icons.close,
              color: Colors.white,
            ),
          ],
        ),
        width: double.infinity,
      ),
      // weather

      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          color: Colors.grey[100],
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  spacer(height: 15),
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
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  spacer(height: 10),
                  MarketTile(
                    text: 'Fertilizer',
                    price: 499,
                    icon: Icons.home,
                  ),
                  MarketTile(
                    text: 'Grains',
                    price: 120,
                    icon: Icons.grain,
                  ),
                  MarketTile(
                    text: 'Sushill',
                    price: 1,
                    icon: Icons.person,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
