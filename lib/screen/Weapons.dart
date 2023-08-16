// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Weapons extends StatelessWidget {
  static const routeName = '/Agents';
  const Weapons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 
      Container(
        height: 140,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            buildCard(),
            SizedBox(width: 12),
            buildCard(),
            SizedBox(width: 12),
            buildCard(),
            SizedBox(width: 12),
          ],
        ),
      )
    );
  }
}

Widget buildCard() => Container(
  width: 200,
  height: 200,
  color: Colors.black,
  //child: Image.network(''),
);