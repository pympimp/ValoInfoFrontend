import 'package:firstflutter/screen/screens.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:firstflutter/data/NewsData.dart';
import 'package:firstflutter/screen/New.dart';

class News extends StatefulWidget {
  static const routeName = '/News';

  const News({super.key});
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  NewsData? _data;

  var newsName = [];

  void _onItemTapped(Datum news) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => New(news: news),
      ),
    );
  }

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var url = Uri.parse('http://10.100.12.8:3000/news');
    var res = await get(url);

    setState(() {
      _data = newsDataFromJson(res.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _data?.data?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final news = _data!.data![index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildNewCard(news),
        );
      },
    );
  }

  Widget _buildNewCard(Datum news) {
    return GestureDetector(
      onTap: () => _onItemTapped(news),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Stack(
          children: [
            // ส่วนของ killStreamIcon
            GestureDetector(
              onTap: () {
                _onItemTapped(news);
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 1),
                      Color.fromARGB(255, 230, 230, 230),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${news.title}', // เปลี่ยนเป็นข้อความที่คุณต้องการแสดง
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Spacer(), // เพิ่ม Spacer เพื่อทำให้เว้นว่างระหว่าง title และ date
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  '${news.date}', // เปลี่ยนเป็นข้อความที่คุณต้องการแสดง
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 68, 68, 68),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            15), // ปรับเป็นค่าที่คุณต้องการ
                        child: Image.network(
                          '${news.image}',
                          width: 130,
                          height: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
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
