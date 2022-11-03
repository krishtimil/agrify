import 'dart:io';
import 'dart:typed_data';

import 'package:agrify/l10n/app_en.dart';
import 'package:agrify/logic/services/shared_prefs.dart';
import 'package:agrify/ui/components/market_tile.dart';
import 'package:agrify/logic/controllers/auth_methods.dart';
import 'package:agrify/ui/components/weather_card.dart';
import 'package:agrify/ui/screens/forum/forum_screen.dart';
import 'package:agrify/ui/screens/infobook/infomation_page.dart';
import 'package:agrify/ui/screens/marketplace/marketplace.dart';
import 'package:agrify/ui/screens/scanner/scanner.dart';
import 'package:agrify/ui/screens/yardplanner/yard_planner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

import '../utilities/image_picker.dart';
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
  Uint8List? _image;

  Widget setBottombarPage() {
    switch (currentIndex) {
      case 0:
        return HomePage(
          isLoggedIn: isLoggedIn,
          currentIndex: currentIndex,
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
        return MarketPlace();
      case 6:
        return Scanner();
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

class HomePage extends StatefulWidget {
  final bool isLoggedIn;
  int currentIndex;

  HomePage({
    Key? key,
    required this.isLoggedIn,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isClosed = false;
  bool getlang = false;
  Map localEng = localizedStrings['english'];
  Map localNep = localizedStrings['nepali'];

  bool isSwitched = false;

  void toggleSwitch(bool value) async {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        SharedPrefs().setBoolean(true);
      });
    } else {
      setState(() {
        isSwitched = false;
        SharedPrefs().setBoolean(false);
      });
    }
  }

  @override
  void initState() {
    langManager();
    super.initState();
  }

  langManager() async {
    getlang = await SharedPrefs().getLang;
  }

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
                      getlang
                          ? localizedStrings['english']['hello']
                          : localizedStrings['nepali']['hello'],
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
                  child: Row(children: [
                    widget.isLoggedIn
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
                    Switch(
                      onChanged: toggleSwitch,
                      value: isSwitched,
                      activeColor: Colors.blue,
                      activeTrackColor: Colors.yellow,
                      inactiveThumbColor: Colors.redAccent,
                      inactiveTrackColor: Colors.orange,
                    )
                  ]),
                )
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
                    getlang ? localEng['search'] : localNep['search'],
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
                  getlang
                      ? localizedStrings['english']['weatherUpdates']
                      : localizedStrings['nepali']['weatherUpdates'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return WeatherPage();
                      },
                    ));
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            spacer(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    WeatherCard(
                      weatherFace: '☁️',
                    ),
                    Text(
                      getlang ? localEng['yesterday'] : localNep['yesterday'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      getlang ? localEng['cloudy'] : localNep['cloudy'],
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
                      getlang ? localEng['today'] : localNep['today'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      getlang ? localEng['sunny'] : localNep['sunny'],
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
                      getlang ? localEng['tomorrow'] : localNep['tomorrow'],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      getlang ? localEng['rainy'] : localNep['rainy'],
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      spacer(height: 25),

      isClosed
          ? SizedBox()
          : Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.red,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getlang ? localEng['hailstone'] : localNep['hailstone'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isClosed = true;
                      });
                    },
                  ),
                ],
              ),
              width: double.infinity,
            ),
      // weather
      spacer(height: 20),
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
                        getlang
                            ? localEng['marketplace']
                            : localNep['marketplace'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return MarketPlace();
                            },
                          ));
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  spacer(height: 10),
                  MarketTile(
                    text: getlang
                        ? localEng['fertilizer']
                        : localNep['fertilizer'],
                    price: 499,
                    icon: Icons.home,
                  ),
                  MarketTile(
                    text: getlang ? localEng['grains'] : localNep['grains'],
                    price: 120,
                    icon: Icons.grain,
                  ),
                  MarketTile(
                    text: getlang ? localEng['apple'] : localNep['apple'],
                    price: 100,
                    icon: Icons.apple,
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
