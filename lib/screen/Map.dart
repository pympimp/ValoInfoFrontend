import 'package:flutter/material.dart';
import 'package:firstflutter/screen/Maps.dart';
import 'package:firstflutter/data/MapsData.dart';

class Map extends StatefulWidget {
  const Map({super.key});
  static const routeName = '/Map';
  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
        centerTitle: true,
        title: const Text(
          'Map',
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
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Center(
                  child: SizedBox(
                    width: 400,
                    height: 200,
                    child: Image.network(
                      'https://media.valorant-api.com/maps/7eaecc1b-4337-bbf6-6ab9-04b8f06b3319/splash.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Features',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer facilisis sed quam sed posuere. Vivamus tristique sapien quis tellus tincidunt interdum. Etiam non auctor justo, at porta diam. Vivamus cursus ligula vitae urna pretium, quis mollis leo dictum.'),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer facilisis sed quam sed posuere. Vivamus tristique sapien quis tellus tincidunt interdum. Etiam non auctor justo, at porta diam. Vivamus cursus ligula vitae urna pretium, quis mollis leo dictum.'),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Map',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Center(
                      child: Image.network(
                        'https://media.valorant-api.com/maps/7eaecc1b-4337-bbf6-6ab9-04b8f06b3319/displayicon.png',
                        height: 300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
