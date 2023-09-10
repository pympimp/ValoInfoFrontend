import 'package:flutter/material.dart';
import 'package:firstflutter/data/NewsData.dart';
// import 'package:firstflutter/data/AgentsData.dart';

class New extends StatefulWidget {
  const New({Key? key, required this.news}) : super(key: key);
  static const routeName = '/New';
 final Datum news;
  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
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
        title: Text(
          widget.news.title ?? '',
          style: const TextStyle(
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
                      '${widget.news.image}',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Text('${widget.news.title}'),
                  Text('${widget.news.title}'),
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
