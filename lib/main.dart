import 'package:firstflutter/screen/HomePage.dart';
import 'package:firstflutter/screen/screens.dart';
import 'package:flutter/material.dart';
import 'package:firstflutter/screen/Agents.dart';
import 'package:firstflutter/screen/Weapons.dart';
import 'package:firstflutter/screen/HomeScreen.dart';
import 'package:firstflutter/screen/Maps.dart';


// เรียกใช้ runApp ฟังก์ชันเพื่อทำการเริ่มต้นแอปพลิเคชัน
void main() {
  runApp(const MyApp());
}

// StatelessWidget ซึ่งเป็นคลาสที่ไม่มีสถานะ (stateless) และจะไม่เปลี่ยนแปลงได้หลังจากสร้างขึ้นมา
// MyApp นี้จะมีการ override ฟังก์ชัน build ซึ่งใช้สร้างและคืนค่าวิดเจ็ตต่าง ๆ ใน UI ของแอปพลิเคชัน
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    var routeName;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ValoInfo',
      // home: HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(), //กำหนดให้ HomeScreen เป็นหน้าหลัก
      initialRoute: '/',
      routes: {
        Agents.routeName: (context) => const Agents(),
        Maps.routeName: (context) => const Maps(),
        Weapons.routeName: (context) => const Weapons()
      },
    );
  }
}

// class myHomePage extends StatefulWidget {
//   const myHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<myHomePage> createState() => _myHomePageState();
// }

// class _myHomePageState extends State<myHomePage> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle = TextStyle(
//       fontFamily: 'SFThonburi', fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0 : Home',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1 : Profile',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2 : Search',
//       style: optionStyle,
//     ),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: Center(
//         child: _widgetOptions[_selectedIndex],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.greenAccent,
//               ),
//               child: Text('Test Drawer'),
//             ),
//             ListTile(
//               title: const Text('Home'),
//               selected: _selectedIndex == 0,
//               onTap: () {
//                 _onItemTapped(0);
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: const Text('Profile'),
//               selected: _selectedIndex == 1,
//               onTap: () {
//                 _onItemTapped(1);
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: const Text('Search'),
//               selected: _selectedIndex == 1,
//               onTap: () {
//                 _onItemTapped(1);
//                 Navigator.pop(context);
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
