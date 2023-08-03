// ignore_for_file: prefer_const_constructors

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
  final urlImages = [
    
    'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/displayicon.png',
    'https://media.valorant-api.com/agents/dade69b4-4f5a-8528-247b-219e5a1facd6/displayicon.png',
    'https://media.valorant-api.com/agents/5f8d3a7f-467b-97f3-062c-13acf203c006/displayicon.png',
    'https://media.valorant-api.com/agents/cc8b64c8-4b25-4ff9-6e7f-37b4da43d235/displayicon.png',
    'https://media.valorant-api.com/agents/f94c3b30-42be-e959-889c-5aa313dba261/displayicon.png',
  ];
  final urlImages2 = [
    'https://media.valorant-api.com/maps/7eaecc1b-4337-bbf6-6ab9-04b8f06b3319/splash.png',
    'https://media.valorant-api.com/maps/d960549e-485c-e861-8d71-aa9d1aed12a2/splash.png',
    'https://media.valorant-api.com/maps/b529448b-4d60-346e-e89e-00a4c527a405/splash.png',
  ];
  final urlImages3 = [
    'https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/killstreamicon.png',
    'https://media.valorant-api.com/weapons/55d8a0f4-4274-ca67-fe2c-06ab45efdf58/killstreamicon.png',
    'https://media.valorant-api.com/weapons/9c82e19d-4575-0200-1a81-3eacf00cf872/killstreamicon.png',
    'https://media.valorant-api.com/weapons/ae3de142-4d85-2547-dd26-4e90bed35cf7/killstreamicon.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(20), // Set the desired border radius
                child: CarouselSlider.builder(
                  itemCount: urlImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = urlImages[index];
                    return buildImage(urlImage, index);
                  },
                  options: CarouselOptions(
                      height: 150,
                      viewportFraction: 0.35,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy
                          .scale // Set the desired height
                      ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20), // Set the desired padding value
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
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ClipRRect(
          //       borderRadius:
          //           BorderRadius.circular(20), // Set the desired border radius
          //       child: CarouselSlider.builder(
          //         itemCount: urlImages.length,
          //         itemBuilder: (context, index, realIndex) {
          //           final urlImage = urlImages[index];
          //           return buildImage(urlImage, index);
          //         },
          //         options: CarouselOptions(
          //           height: 150, // Set the desired height
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CarouselSlider.builder(
              itemCount: urlImages3.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage3 = urlImages3[index];
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(124, 57, 232, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    urlImage3,
                    width: 180,
                    height: 100,
                    
                  ),
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

          Padding(
            padding: EdgeInsets.all(20), // Set the desired padding value
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(20), // Set the desired border radius
                child: CarouselSlider.builder(
                  itemCount: urlImages2.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage2 = urlImages2[index];
                    return buildImage(urlImage2, index);
                  },
                  options: CarouselOptions(
                      height: 150,
                      viewportFraction: 0.7,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy
                          .zoom // Set the desired height
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

Widget buildImage(String urlImage, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      // color: Colors.grey, // Set the desired aspect ratio (1:1 in this case)
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // กำหนดความโค้งของมุมเพื่อให้มีขอบมน
        child: Image.network(urlImage, fit: BoxFit.cover),
      ),
    );
