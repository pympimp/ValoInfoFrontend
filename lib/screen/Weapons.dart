// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Weapons extends StatelessWidget {
  static const routeName = '/Weapons';
  const Weapons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(

      body: Center( // ใช้ Center Widget เพื่อให้ข้อความอยู่ตรงกลางของหน้าจอ
        child: Text(
          'Weapons Coming Soon',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}