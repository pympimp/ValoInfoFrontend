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
  AgentsData? _data;

  var agentsName = [];

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var url = Uri.parse('https://valorant-api.com/v1/agents');
    var res = await get(url);

    setState(() {
      _data = agentsDataFromJson(res.body);
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
      body: _data == null
          ? Center(
              child: Container(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation<Color>(const Color.fromRGBO(199, 244, 90, 1)),
                backgroundColor: Colors.grey,
              ),
            ))
          : Column(
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Positioned.fill(
                      child: Opacity(
                        opacity:
                            0.5, // ปรับค่า opacity ตามที่คุณต้องการ (ระหว่าง 0.0 ถึง 1.0)
                        child: Image.network(
                          '${agent.background}' ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Image.network(
                        '${agent.fullPortrait}',
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
                        '${agent.role?.roleName}',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    Positioned(
                      left: 15,
                      bottom: 45,
                      child: Text(
                        '${agent.displayName}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
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
                                  'Description',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 60, 22, 121)),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              '${agent.description}',
                              style: TextStyle(
                                  fontSize: 15.5,
                                  color: Color.fromARGB(255, 85, 85, 85)),
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
                                      color: Color.fromARGB(255, 61, 85, 5)),
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
                                  backgroundColor:
                                      const Color.fromRGBO(199, 244, 90, 1),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.network(
                                      '${agent.abilities?[0].skillIcon}',
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${agent.abilities?[0].skillName}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(255, 61, 85, 5)),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                          '     ${agent.abilities?[0].skillDescription}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 85, 85, 85))),
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
                                  backgroundColor:
                                      const Color.fromRGBO(199, 244, 90, 1),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.network(
                                      '${agent.abilities?[1].skillIcon}',
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${agent.abilities?[1].skillName}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(255, 61, 85, 5)),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        '     ${agent.abilities?[1].skillDescription}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 85, 85, 85)),
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
                                  backgroundColor:
                                      const Color.fromRGBO(199, 244, 90, 1),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.network(
                                      '${agent.abilities?[2].skillIcon}',
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${agent.abilities?[2].skillName}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(255, 61, 85, 5)),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        '     ${agent.abilities?[2].skillDescription}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 85, 85, 85)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor:
                                      const Color.fromRGBO(199, 244, 90, 1),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.network(
                                      '${agent.abilities?[3].skillIcon}',
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${agent.abilities?[3].skillName}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(255, 61, 85, 5)),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        '     ${agent.abilities?[3].skillDescription}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 85, 85, 85)),
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
