// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:firstflutter/data/AgentsData.dart';
// import 'package:firstflutter/screen/New.dart';

// class News extends StatefulWidget {
//   static const routeName = '/News';

//   News({Key? key, required this.news}) : super(key: key);

//   final Datum news;
//   @override
//   State<News> createState() => _NewsState();
// }

// class _NewsState extends State<News> {
//   AgentsData? _data;

//   var mapsName = [];

//   void _onItemTapped(Datum map) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => New(news: news),
//       ),
//     );
//   }

//   void initState() {
//     super.initState();
//     getData();
//   }

//   Future<void> getData() async {
//     var url = Uri.parse('https://valorant-api.com/v1/agents');
//     var res = await get(url);

//     setState(() {
//       _data = mapsDataFromJson(res.body);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     final news = widget.news;


//     return Container(
//       color: Colors.amber,
//     );
//   }
// }