import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';
import 'firstpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String email;
  email=prefs.getString('email');
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
       home: email != null ? myDashboard() : firstPage()
      ) 
    ); 
  }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: firstPage(),
    );
  }
}
