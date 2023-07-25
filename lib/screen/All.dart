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
                    height: 150, // Set the desired height
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
                    height: 150, // Set the desired height
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
                  itemCount: urlImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = urlImages[index];
                    return buildImage(urlImage, index);
                  },
                  options: CarouselOptions(
                    height: 150, // Set the desired height
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
    margin: EdgeInsets.symmetric(horizontal: 2),
    child: Image.network(urlImage, fit: BoxFit.cover));
