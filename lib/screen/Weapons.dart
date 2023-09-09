// ignore_for_file: prefer_const_constructors

// import 'dart:collection';

import 'package:firstflutter/screen/Agent.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:firstflutter/data/WeaponsData.dart';
import 'package:firstflutter/screen/Weapon.dart';

class Weapons extends StatefulWidget {
  static const routeName = '/Weapons';
  const Weapons({super.key});

  @override
  State<Weapons> createState() => _WeaponsState();
}

class _WeaponsState extends State<Weapons> {
  WeaponsData? _data;

  var weaponsName = [];

void _onItemTapped(Datum weapon) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Weapon(weapon: weapon),
    ),
  );
}

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var url = Uri.parse('https://valorant-api.com/v1/weapons');
    var res = await get(url);

    setState(() {
      _data = weaponsDataFromJson(res.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _data?.data?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final weapon = _data!.data![index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildWeaponCard(weapon),
        );
      },
    );
  }

  Widget _buildWeaponCard(Datum weapon) {
    return GestureDetector(
    onTap: () {
      _onItemTapped(weapon);
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 2),
      child: Container(
        width: 150, // ปรับขนาดตามที่ต้องการ
        height: 150, // ปรับขนาดตามที่ต้องการ
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(124, 57, 232, 1), // สีเริ่มต้น
              Color.fromARGB(255, 58, 58, 58), // สีสุดท้าย
            ],
            begin: Alignment.topCenter, // จุดเริ่มต้นของเส้นเชิงเส้น
            end: Alignment.bottomCenter, // จุดสุดท้ายของเส้นเชิงเส้น
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            // ส่วนของ killStreamIcon
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Positioned(
                top: 30,
                left: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    weapon.displayIcon ?? '',
                    width: 400,
                    height: 100,
                  ),
                ),
              ),
            ),

            // ส่วนของ displayName
            Positioned(
              bottom: 10, // ระยะห่างจากด้านล่าง
              left: 10, // ระยะห่างจากด้านซ้าย
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  weapon.displayName ?? '', // แสดงชื่ออาวุธ
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
