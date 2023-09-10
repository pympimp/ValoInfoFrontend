// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:firstflutter/screen/Agents.dart';
import 'package:firstflutter/screen/News.dart';
import 'package:firstflutter/screen/Weapons.dart';
import 'package:firstflutter/screen/Maps.dart';
import 'package:firstflutter/screen/All.dart';
import 'package:firstflutter/screen/screens.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // สร้าง MaterialApp และกำหนด theme ที่นี่
      theme: ThemeData(
        brightness: isSwitched ? Brightness.dark : Brightness.light,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'SFThonburi',
          ),
          bodyText2: TextStyle(
            fontFamily: 'SFThonburi',
          ),
        ),
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu),
                color: Color.fromRGBO(124, 57, 232, 100),
                onPressed: () {
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
                //activeColor: Color.fromRGBO(111, 144, 30, 1),
                activeColor: Color.fromRGBO(124, 57, 232, 1),
                inactiveThumbColor: Color.fromRGBO(124, 57, 232, 1),
                //activeTrackColor: Color.fromRGBO(199, 244, 90, 1),
                activeTrackColor: Color.fromRGBO(222, 213, 235, 1),
                inactiveTrackColor: Color.fromRGBO(222, 213, 235, 1),
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('All',
                      style: TextStyle(
                          color: isSwitched ? Colors.white : Colors.black)),
                ),
                Tab(
                  child: Text('Agents',
                      style: TextStyle(
                          color: isSwitched ? Colors.white : Colors.black)),
                ),
                Tab(
                  child: Text('Weapons',
                      style: TextStyle(
                          color: isSwitched ? Colors.white : Colors.black)),
                ),
                Tab(
                  child: Text('Maps',
                      style: TextStyle(
                          color: isSwitched ? Colors.white : Colors.black)),
                ),
              ],
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 4.0,
                  color: Color.fromRGBO(124, 57, 232, 1),
                ),
                insets: EdgeInsets.symmetric(horizontal: 25.0),
              ),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(199, 244, 90, 1)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'ValoInfo',
                      style: TextStyle(
                          fontFamily: 'ValorantFont',
                          color: Colors.white,
                          fontSize: 30),
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
                  leading: Icon(
                    Icons.person,
                    color: Color.fromRGBO(111, 144, 30, 1),
                  ),
                  title: Text('Agents'),
                  onTap: () {
                    Navigator.pushNamed(context, '/Agents');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.colorize,
                    color: Color.fromRGBO(111, 144, 30, 1),
                  ),
                  title: Text('Weapons'),
                  onTap: () {
                    Navigator.pushNamed(context, '/Weapons');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.map,
                    color: Color.fromRGBO(111, 144, 30, 1),
                  ),
                  title: Text('Maps'),
                  onTap: () {
                    Navigator.pushNamed(context, '/Maps');
                  },
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              News(),
              //ลิงก์ไปหา Agents.dart ถ้ากด Tab 2
              Agents(),
              //ลิงก์ไปหา Weapons.dart ถ้ากด Tab 3
              Weapons(),
              //ลิงก์ไปหา Maps.dart ถ้ากด Tab 4
              Maps(),
              // Add the content of each tab here
            ],
          ),
        ),
      ),
    );
  }
}
