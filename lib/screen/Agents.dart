import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:firstflutter/data/AgentsData.dart';
import 'package:firstflutter/screen/Agent.dart';

class Agents extends StatefulWidget {
  const Agents({super.key});

  static const routeName = '/Agents';
  @override
  State<Agents> createState() => _AgentsState();
}

class _AgentsState extends State<Agents> {
  Agentsdata? _data;

  var agentsName = [];

  void _onItemTapped(item) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Agent(agentsName: item)));
  }

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var url = Uri.parse('https://valorant-api.com/v1/agents');
    var res =  await get(url);

    setState(() {
      _data = agentsdataFromJson(res.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: (_data?.data?.length ?? 0) ~/ 2, // หาจำนวนครึ่งของข้อมูล
        itemBuilder: (BuildContext context, int index) {
          final firstIndex = index * 2;
          final secondIndex = firstIndex + 1;
          final firstData = _data?.data?[firstIndex];
          final secondData = _data?.data?[secondIndex];

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0), // เพิ่ม padding ที่นี่
                child: _buildAgentCard(firstData),
              ),
              SizedBox(width: 5), // ระยะห่างระหว่าง 2 Agent Card
              if (secondData != null)
                Padding(
                  padding: const EdgeInsets.all(8.0), // เพิ่ม padding ที่นี่
                  child: _buildAgentCard(secondData),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAgentCard(Datum? data) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(data?.displayName),
        child: Container(
          width: 170,
          height: 170,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 231, 231, 231),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 153,
                height: 153,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 231, 231, 231),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      '${data?.displayIcon}',
                      width: 180,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 5,
                      left: 5,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4), // ระยะห่างใน Container
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1)
                              .withOpacity(0.5), // สีพื้นหลัง
                          borderRadius:
                              BorderRadius.circular(8), // ความโค้งของมุม
                        ),
                        child: Text(
                          '${data?.displayName}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
