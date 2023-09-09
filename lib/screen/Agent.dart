import 'package:flutter/material.dart';
import 'package:firstflutter/data/AgentsData.dart';
import 'package:http/http.dart';

class Agent extends StatefulWidget {
  static const routeName = '/Agent';

  // static Future<void> NavigatorPush(BuildContext context) async {
  //   return Navigator.push<void>(
  //     context,
  //     MaterialPageRoute(builder: (_) => Agent()),
  //   );
  // }

  final Datum agent;
  var agentsName;
  Agent({Key? key, required this.agent}) : super(key: key);

  @override
  State<Agent> createState() => _AgentState();
}

class _AgentState extends State<Agent> {
  Agentsdata? _data;

  var agentsName = [];

  void initState() {
    super.initState();
    getData();
  }
  
  Future<void> getData() async {
    var url = Uri.parse('https://valorant-api.com/v1/agents');
    var res = await get(url);

    setState(() {
      _data = agentsdataFromJson(res.body);
    });
  }
  @override
Widget build(BuildContext context) {
  final agent = widget.agent;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(124, 57, 232, 1),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Image.network(
                  'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/fullportrait.png',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, bottom: 15),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(199, 244, 90, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'T',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Positioned(
                left: 15, // ปรับตำแหน่งตามความต้องการ
                bottom: 45, // ปรับตำแหน่งตามความต้องการ
                child: Text(
                  'T',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              decoration: const BoxDecoration(
                color: Colors.white,
                //ให้มนแค่ซ้ายบนและขวาบน
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'DescriptionT',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 60, 22, 121)
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        '${agent.description}',
                        style: TextStyle(fontSize: 15.5, color: Color.fromARGB(255, 85, 85, 85)),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Text(
                            'Skill',
                            style: TextStyle(
                            
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 61, 85, 5)
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Wingman
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: const Color.fromRGBO(199, 244, 90, 1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.network(
                                'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ability1/displayicon.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Wingman',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 61, 85, 5)
                                ),
                              ),
                              Text(
                                '     FIRE to send Wingman forward seeking enemies. Wingman unleashes a concussive blast toward the first enemy he sees.',
                                style: TextStyle(
                                color:Color.fromARGB(255, 85, 85, 85)
                              )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //Dizzy
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: const Color.fromRGBO(199, 244, 90, 1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.network(
                                'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ability2/displayicon.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dizzy',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 61, 85, 5)
                                ),
                              ),
                              Text(
                                '     FIRE to send Dizzy soaring forward through the air. Dizzy charges then unleashes plasma blasts at enemies in line of sight.',
                                style: TextStyle(
                                color:Color.fromARGB(255, 85, 85, 85)
                              ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //Mosh Pit
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: const Color.fromRGBO(199, 244, 90, 1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.network(
                                'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/grenade/displayicon.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mosh Pit',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 61, 85, 5)
                                ),
                              ),
                              Text(
                                '     FIRE to throw Mosh like a grenade. ALT FIRE to throw underhand. Upon landing Mosh duplicates across a large area then after a short delay explodes.',
                              style: TextStyle(
                                color:Color.fromARGB(255, 85, 85, 85)
                              ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // ... Repeat similar code for other skills ...
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
