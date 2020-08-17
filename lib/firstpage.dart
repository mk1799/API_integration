import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginPage.dart';



class firstPage extends StatefulWidget {
  @override
  _firstPageState createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  void initState() {
    super.initState();
    //delay animation
    new Future.delayed(               
      const Duration(seconds: 4),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => loginPage(),
        ),
      ),
    );
  }

  addStringToSF(String e) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', e);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Text(
              'Hello',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}