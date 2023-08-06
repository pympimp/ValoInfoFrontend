import 'package:flutter/material.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  static const routeName = '/Maps';
  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center( // ใช้ Center Widget เพื่อให้ข้อความอยู่ตรงกลางของหน้าจอ
        child: Text(
          'Maps Coming Soon',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}