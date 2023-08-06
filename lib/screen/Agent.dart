import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:firstflutter/screen/Agents.dart';

class Agent extends StatefulWidget {
  static const routeName = '/Agent';

  static Future<void> NavigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(builder: (_) => Agent()),
    );
  }

  var agentsName;
  Agent({super.key, this.agentsName});

  @override
  State<Agent> createState() => _AgentState();
}

class _AgentState extends State<Agent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(124, 57, 232, 1),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(
            color: Color.fromARGB(255, 255, 255, 255),
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Image.network(
              'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/fullportrait.png',
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left:10),
                        child: Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      'Gekko the Angeleno leads a tight-knit crew of calamitous creatures. His buddies bound forward, scattering enemies out of the way, with Gekko chasing them down to regroup and go again',
                      style: TextStyle(fontSize: 15.5),
                      
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10,top: 10),
                    child: Row(
                      children: [
                        Text('Skill', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class Agent extends StatelessWidget {

//   static const routeName = '/Agent';

//   const Agent({super.key, this.agentsName}); ({Key? key, required.this.agentsName}) : super(key: key);
  
//   final AgentsName agentsName; 

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

