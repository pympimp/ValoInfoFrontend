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
          color: Color.fromRGBO(50, 50, 50, 1),
        ),
        centerTitle: true,
        title: Text(
          widget.news.title ?? '',
          style: const TextStyle(
            color: Color.fromRGBO(50, 50, 50, 1),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(left: 30, right: 30),
            sliver: SliverToBoxAdapter(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = widget.news.desctiption?[index];

                if (item != null) {
                  return Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // ทำให้ข้อความชิดซ้าย
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, bottom: 5, left: 5),
                        child: Container(
                          margin: const EdgeInsets.only(left: 5,),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(188, 56, 68, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              item.header ?? '',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(255, 251, 244, 1)
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          item.body ?? '',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(85, 85, 85, 1)),
                        ),
                      ),
                    ],
                  );
                } else {
                  // Handle the case where item is null if necessary
                  return SizedBox.shrink(); // Placeholder if item is null
                }
              },
              childCount: widget.news.desctiption?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}

/* Color Theme Swatches in RGBA */
// .Valorant-1-rgba { color: rgba(253, 68, 86, 1); }
// .Valorant-2-rgba { color: rgba(188, 56, 68, 1); }
// .Valorant-3-rgba { color: rgba(82, 33, 42, 1); }
// .Valorant-4-rgba { color: rgba(255, 251, 244, 1); }
// .Valorant-5-rgba { color: rgba(0, 0, 0, 1); }


