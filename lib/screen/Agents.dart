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
  
  var AgentsName = [];

  void _onItemTapped(item){
    Navigator.push(context,
     MaterialPageRoute(builder: (context)=> Agent(agentsName: item)));
     }

    void initState(){
      super.initState();
      getData();
    }

    Future<void> getData () async {
      var url = Uri.parse('https://valorant-api.com/v1/agents');
      var res = await get(url);

      setState(() {
        _data = agentsdataFromJson(res.body);
      });
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView.builder(
        itemCount: _data?.data?.length,
        itemBuilder: (BuildContext context, int index){
            Datum? _DATA = _data?.data?[index];
        
            return GestureDetector(
              //เทียบได้กับการใส่ค่าแบบ _onItemTapped(item) ใน JS
              onTap: ()=>{_onItemTapped(_DATA?.displayName)}, 
              //มีลูกได้ 1 คน แสดงผลเป็นการ์ด
              child: Card(
                color: const Color.fromARGB(255, 135, 172, 212),
                child: ListTile(
                  title: Text('${_DATA?.displayName}',
                  style: TextStyle(
                    color: Color.fromARGB(255, 65, 74, 122),
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  )
                  ),
                  //หาง ใส่ ? เพราะว่า DATA อาจจะยังไม่มีข้อมูลมาทันที
                  trailing: Text('${_DATA?.role?.displayName}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            );
        }),
    );
  }
}