import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class myDashboard extends StatefulWidget {
  myDashboard({Key key}) : super(key: key);
  @override
  _myDashboardState createState() => _myDashboardState();
}

class _myDashboardState extends State<myDashboard> {
  final String url = "https://www.iroidsolutions.com/interview/test.json";
  List data;

  @override
  void initState() {
    super.initState();
    this.getjson();
  }

  Future<String> getjson() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    print(response.body);

    setState(() {
      //  var convertdatatojson
      data = json.decode(response.body);
      //  data = convertdatatojson[" "];
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 100,
              margin: const EdgeInsets.all(8),
                child: Row(children: <Widget>[
                   Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  data[index]['picture'],
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(width: 10,),
                  Flexible(
                                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding:EdgeInsets.all(5.0)),
                        Text(data[index]['name'],overflow: TextOverflow.ellipsis,style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
                        Text("Email:${data[index]['email']}",overflow: TextOverflow.ellipsis,),
                        Text("Phone:${data[index]['phone']}",overflow: TextOverflow.ellipsis,),
                        Text("Company:${data[index]['company']}",overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                  ),
                ]),
              
            );
          }),
    );
  }
}
