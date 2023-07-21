// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// required String title
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSwitched = false;

  @override
  // double fem = 1.5;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //กำหนดฟอนต์ default
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'SFThonburi',
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent, //ทำให้ appBar โปร่งแสง
          elevation: 0, // ลบ shadow ออกจาก appBar
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              color: Color.fromRGBO(124, 57, 232, 100),
              onPressed: () {
                // Open the drawer when the menu button is pressed
                Scaffold.of(context).openDrawer();
              },
            ),
          ),

          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: Color.fromRGBO(111, 144, 30, 1),
              inactiveThumbColor: Color.fromRGBO(124, 57, 232, 1),
              activeTrackColor: Color.fromRGBO(
                  199, 244, 90, 1), // กำหนดสีให้กับสวิตซ์เมื่อเปิด (ON)
              inactiveTrackColor: Color.fromRGBO(222, 213, 235, 1),
            ),
          ],
        ),
        body: Center(
          child: Text('ทดสอบฟอนต์'),
        ),
        drawer: Drawer(
          // Add your sidebar content here
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(199, 244, 90, 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'ValoInfo',
                    style: TextStyle(
                      fontFamily: 'ValorantFont',
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home_filled,
                  color: Color.fromRGBO(111, 144, 30, 1),
                ),
                title: Text('Home Page'),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.person, color: Color.fromRGBO(111, 144, 30, 1)),
                title: Text('Agents'),
                onTap: () {
                  Navigator.pushNamed(context, '/Agents');
                },
              ),
              ListTile(
                leading: Icon(Icons.colorize,
                    color: Color.fromRGBO(111, 144, 30, 1)),
                title: Text('Weapons'),
                onTap: () {
                  Navigator.pushNamed(context, '/Weapons');
                },
              ),
              ListTile(
                leading: Icon(Icons.map,
                    color: Color.fromRGBO(111, 144, 30, 1)),
                title: Text('Maps'),
                onTap: () {
                  Navigator.pushNamed(context, '/Maps');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
