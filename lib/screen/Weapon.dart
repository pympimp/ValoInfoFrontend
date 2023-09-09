// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firstflutter/data/WeaponsData.dart';

class Weapon extends StatefulWidget {
  static const routeName = '/Weapon';

  Weapon({Key? key, required this.weapon}) : super(key: key);

  final Datum weapon; // เพิ่มพารามิเตอร์ weapon
  @override
  State<Weapon> createState() => _WeaponState();
}

class _WeaponState extends State<Weapon> {
  @override
  Widget build(BuildContext context) {
    final weapon = widget.weapon;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
        centerTitle: true,
        title: Text(
          widget.weapon.displayName ?? '',
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(124, 57, 232, 1),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(82, 82, 82, 0.639)
                                .withOpacity(0.2), // สีของเงา
                            spreadRadius: 2, // รัศมีการกระจายของเงา
                            blurRadius: 5, // ความเบลอของเงา
                            offset: Offset(0, 3), // ตำแหน่งเงา
                          ),
                        ],
                      ),
                      child: Text(
                        'Details',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 254, 254, 254),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('Cost : ', style: TextStyle(fontSize: 18)),
                            Text('${widget.weapon.shopData?.cost}',
                                style: TextStyle(fontSize: 18))
                          ],
                        ),
                        Row(
                          children: [
                            Text('Category : ', style: TextStyle(fontSize: 18)),
                            Text('${widget.weapon.shopData?.category}',
                                style: TextStyle(fontSize: 18))
                          ],
                        ),
                        Row(
                          children: [
                            Text('Fire Rate : ',
                                style: TextStyle(fontSize: 18)),
                            Text('${widget.weapon.weaponStats?.fireRate}',
                                style: TextStyle(fontSize: 18))
                          ],
                        ),
                        Row(
                          children: [
                            Text('Magazine Size : ',
                                style: TextStyle(fontSize: 18)),
                            Text('${widget.weapon.weaponStats?.magazineSize}',
                                style: TextStyle(fontSize: 18))
                          ],
                        ),
                        Row(
                          children: [
                            Text('Equip Time : ',
                                style: TextStyle(fontSize: 18)),
                            Text(
                                '${widget.weapon.weaponStats?.equipTimeSeconds} s',
                                style: TextStyle(fontSize: 18))
                          ],
                        ),
                        Row(
                          children: [
                            Text('Reload Time : ',
                                style: TextStyle(fontSize: 18)),
                            Text(
                                '${widget.weapon.weaponStats?.reloadTimeSeconds} s',
                                style: TextStyle(fontSize: 18))
                          ],
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(124, 57, 232, 1),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(82, 82, 82, 0.639)
                                    .withOpacity(0.2), // สีของเงา
                                spreadRadius: 2, // รัศมีการกระจายของเงา
                                blurRadius: 5, // ความเบลอของเงา
                                offset: Offset(0, 3), // ตำแหน่งเงา
                              ),
                            ],
                          ),
                          child: Text(
                            'Damage',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 254, 254, 254),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                    Row(children: [
                      Image.asset(
                        'assets/images/bot.png',
                        width: 200,
                        height: 200,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // กำหนดให้ children ชิดซ้าย
                        children: [
                          Text('0-30 m',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          Row(
                            children: [
                              Text('Head : ', style: TextStyle(fontSize: 18)),
                              Text(
                                  '${widget.weapon.weaponStats?.damageRanges?.first?.headDamage ?? 'N/A'}',
                                  style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Body : ', style: TextStyle(fontSize: 18)),
                              Text(
                                  '${widget.weapon.weaponStats?.damageRanges?.first?.bodyDamage ?? 'N/A'}',
                                  style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Leg : ', style: TextStyle(fontSize: 18)),
                              Text(
                                  '${widget.weapon.weaponStats?.damageRanges?.first?.legDamage ?? 'N/A'}',
                                  style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              '30-50 m',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Row(
                            children: [
                              Text('Head : ', style: TextStyle(fontSize: 18)),
                              Text(
                                  '${widget.weapon.weaponStats?.damageRanges?.last?.headDamage ?? 'N/A'}',
                                  style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Body : ', style: TextStyle(fontSize: 18)),
                              Text(
                                  '${widget.weapon.weaponStats?.damageRanges?.last?.bodyDamage ?? 'N/A'}',
                                  style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Leg : ', style: TextStyle(fontSize: 18)),
                              Text(
                                  '${widget.weapon.weaponStats?.damageRanges?.last?.legDamage ?? 'N/A'}',
                                  style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ],
                      )
                    ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Container(
                width: 420,
                height: 306,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(199, 244, 90, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // สีของเงา
                      spreadRadius:
                          5, // รัศมีการกระจายของเงา (ให้เป็นค่าลบเพื่อให้เงาเป็น inner shadow)
                      blurRadius: 10, // ความเบลอของเงา
                      // ตำแหน่งเงา (ให้เงาอยู่ด้านบน)
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.network(
                          '${widget.weapon.displayIcon}',
                          height: 290,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
