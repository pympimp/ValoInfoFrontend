import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:firstflutter/data/MapsData.dart';
import 'package:firstflutter/screen/Map.dart';
import 'package:firstflutter/screen/Agent.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});
  static const routeName = '/Maps';

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  MapsData? _data;

  var mapsName = [];

  void _onItemTapped(Datum map) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Map(map: map),
      ),
    );
  }

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var url = Uri.parse('https://valorant-api.com/v1/maps');
    var res = await get(url);

    setState(() {
      _data = mapsDataFromJson(res.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _data?.data?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final map = _data!.data![index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildMapCard(map),
        );
      },
    );
  }

  Widget _buildMapCard(Datum map) {
    return GestureDetector(
  onTap: () => _onItemTapped(map),
  child :Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Stack(
        children: [
          // ส่วนของ killStreamIcon
          Padding(
              padding: const EdgeInsets.only(left: 4, right: 4, top: 5),
              child: CustomPaint(
                painter: InnerShadowPainter(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    map.splash ?? '',
                    width: 400,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
              )),

          // ส่วนของ displayName
          Positioned(
            bottom: 10, // ระยะห่างจากด้านล่าง
            left: 10, // ระยะห่างจากด้านซ้าย
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                map.displayName ?? '', // แสดงชื่ออาวุธ
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}

class InnerShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5);

    final Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)),
          Radius.circular(15)))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
