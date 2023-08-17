// ignore_for_file: prefer_const_constructors

import 'package:firstflutter/screen/Agent.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class All extends StatefulWidget {
  const All({super.key});

  static const routeName = '/All';
  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  int activeIndex = 0;
  final controller = CarouselController();
  final AgentsUrlText = [
    {
      'url':
          'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/displayicon.png',
      'text': 'Gecko'
    },
    {
      'url':
          'https://media.valorant-api.com/agents/dade69b4-4f5a-8528-247b-219e5a1facd6/displayicon.png',
      'text': 'Fade'
    },
    {
      'url':
          'https://media.valorant-api.com/agents/5f8d3a7f-467b-97f3-062c-13acf203c006/displayicon.png',
      'text': 'Breach'
    },
    {
      'url':
          'https://media.valorant-api.com/agents/cc8b64c8-4b25-4ff9-6e7f-37b4da43d235/displayicon.png',
      'text': 'Deadlock'
    },
    {
      'url':
          'https://media.valorant-api.com/agents/f94c3b30-42be-e959-889c-5aa313dba261/displayicon.png',
      'text': 'Raze'
    },
    // ลบส่วนนี้ออก
  ];

  final weaponsUrlText = [
    {
      'url':
          'https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/killstreamicon.png',
      'text': 'Odin'
    },
    {
      'url':
          'https://media.valorant-api.com/weapons/55d8a0f4-4274-ca67-fe2c-06ab45efdf58/killstreamicon.png',
      'text': 'Ares'
    },
    {
      'url':
          'https://media.valorant-api.com/weapons/9c82e19d-4575-0200-1a81-3eacf00cf872/killstreamicon.png',
      'text': 'Vandal'
    },
  ];
  final MapsUrlText = [
    {
      'url':
          'https://media.valorant-api.com/maps/7eaecc1b-4337-bbf6-6ab9-04b8f06b3319/splash.png',
      'text': 'Ascent'
    },
    {
      'url':
          'https://media.valorant-api.com/maps/d960549e-485c-e861-8d71-aa9d1aed12a2/splash.png',
      'text': 'Split'
    },
    {
      'url':
          'https://media.valorant-api.com/maps/b529448b-4d60-346e-e89e-00a4c527a405/splash.png',
      'text': 'Fracture'
    },
    {
      'url':
          'https://media.valorant-api.com/maps/2c9d57ec-4431-9c5e-2939-8f9ef6dd5cba/splash.png',
      'text': 'Bind'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          //WingMan Big Image
          Padding(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                // padding: EdgeInsets.only(top:5),
                width: MediaQuery.of(context).size.width *
                    0.9, // Set the desired width
                height: MediaQuery.of(context).size.height *
                    0.2, // Set the desired height
                child: Image.asset(
                  'assets/images/WMAllPage.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          //Agents Topic
          Padding(
            padding: EdgeInsets.only(left: 20), // Set the desired padding value
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Agents',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          //Agents List
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CarouselSlider.builder(
                    itemCount: AgentsUrlText.length,
                    itemBuilder: (context, index, realIndex) {
                      final agentInfo = AgentsUrlText[index];
                      //ใส่ ! ให้ข้อมูลเป็น Nullable ได้
                      return InkWell(
                        //Link ไปยังหน้า Agent
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Agent(agentsName: agentInfo['text']),
                            ),
                          );
                        },
                        child: buildImageWithText(
                          agentInfo['url']!,
                          agentInfo['text']!,
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 150,
                      viewportFraction: 0.35,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    )),
              )
            ],
          ),

          //Weapons Topic
          Padding(
            padding: EdgeInsets.all(15), // Set the desired padding value
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Weapons',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          //Weapons List
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CarouselSlider.builder(
              itemCount: weaponsUrlText.length,
              itemBuilder: (context, index, realIndex) {
                final weaponInfo = weaponsUrlText[index];
                return PhysicalModel(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  elevation: 4, //
                  shadowColor: Colors.grey.withOpacity(0.5), // Shadow color
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(124, 57, 232, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:
                          buildCard(weaponInfo['url']!, weaponInfo['text']!)),
                );
              },
              options: CarouselOptions(
                height: 150,
                // autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) {
                  // Update the activeIndex when the page changes
                  setState(() {
                    activeIndex = index;
                  });
                },
                viewportFraction:
                    0.6, // Set the fraction of the item width that should be visible
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
              ),
            ),
          ),

          //Maps Topic
          Padding(
            padding: EdgeInsets.all(15), // Set the desired padding value
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Maps',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          //Maps Lists
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(bottom: 20), // เพิ่ม padding ที่คุณต้องการ
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CarouselSlider.builder(
                    itemCount: MapsUrlText.length,
                    itemBuilder: (context, index, realIndex) {
                      final mapInfo = MapsUrlText[index];
                      return buildImageWithText(
                          mapInfo['url']!, mapInfo['text']!);
                    },
                    options: CarouselOptions(
                      height: 150,
                      viewportFraction: 0.7,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

Widget buildImageWithText(String urlImage, String text) => Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              urlImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 13,
          left: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // แก้ตามต้องการ
            child: Container(
              padding: EdgeInsets.all(5),
              color: Colors.white.withOpacity(0.5),
              child: Text(
                text,
                style: TextStyle(
                  color: const Color.fromARGB(255, 56, 56, 56),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );

Widget buildCard(String urlImage, String text) => Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: Stack(
          children: [
            Image.network(
              urlImage,
              width: 300,
              height: 165,
            ),
            Positioned(
              bottom: 5,
              left: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 255, 255, 255)
                          .withOpacity(0.3), // สีเงา
                    ),
                  ],
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 68, 68, 68),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
