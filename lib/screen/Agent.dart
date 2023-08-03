import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:firstflutter/screen/Agents.dart';

class Agent extends StatefulWidget {
  static const routeName = '/Agent';

  static Future<void> NavigatorPush(BuildContext context) async{
    return Navigator.push<void>(
      context,
      MaterialPageRoute(builder: (_)=>Agent()
      ),
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // ให้กลับไปที่หน้าที่มีชื่อว่า HomePage ด้วยการใช้ Navigator.popUntil()
            Navigator.popUntil(context, ModalRoute.withName('/')); // กลับไปที่หน้าหลัก (HomePage.dart)
          },
        ),
      ),
    
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.zero,
            height: MediaQuery.of(context).size.height * 0.48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(124, 57, 232, 1),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                    'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/fullportrait.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 67,
            left: 30,
            child: Text(
              'Gecko',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            child: Container(
              padding: EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(199, 244, 90, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              
              child: Text(
                'Initiator',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          
          // สามารถเพิ่ม Widget อื่นๆ ที่ต้องการแสดงบน Container พื้นหลังได้ตรงนี้
        ],
      ),
    );
  }
}

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('data')
      ],
    );
  }
}
