import 'package:flutter/material.dart';
import 'package:firstflutter/screen/News.dart';
// import 'package:firstflutter/data/NewsData.dart';
import 'package:firstflutter/data/AgentsData.dart';

class New extends StatefulWidget {
  New({Key? key, required this.news}) : super(key: key);
  static const routeName = '/New';
 final Datum news;
  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
