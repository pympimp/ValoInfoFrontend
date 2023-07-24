import 'package:flutter/material.dart';

class Weapons extends StatefulWidget {
  const Weapons({super.key});

  static const routeName = '/Weapons';
  @override
  State<Weapons> createState() => _WeaponsState();
}

class _WeaponsState extends State<Weapons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text('Weapons Page', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}