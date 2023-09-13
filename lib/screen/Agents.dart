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
  AgentsData? _data;

  var agentsName = [];

  void _onItemTapped(Datum agent) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Agent(agent: agent),
      ),
    );
  }

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var url = Uri.parse('http://10.100.12.8:3000/agents');
    var res = await get(url);

    setState(() {
      _data = agentsDataFromJson(res.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
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
                child: _buildAgentCard(firstData!),
              ),
              const SizedBox(width: 5), // ระยะห่างระหว่าง 2 Agent Card
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

  Widget _buildAgentCard(Datum agent) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(agent),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: 165,
            height: 165,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(212, 212, 212, 1), // สีเริ่มต้น
                  Colors.white, // สีสุดท้าย
                ],
                begin: Alignment.topCenter, // จุดเริ่มต้นของเส้นเชิงเส้น
                end: Alignment.bottomCenter, // จุดสุดท้ายของเส้นเชิงเส้น
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Image.network(
                  '${agent.displayIcon}',
                  width: 180,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.3), // สีเงา
                        ),
                      ],
                    ),
                    child: Text(
                      '${agent.displayName}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 68, 68, 68),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
