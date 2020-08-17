import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;
import 'dashboard.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String check_email = "admin@iroidsolutions.com";
  String check_pass = "admin";
  String email, password;
  SharedPreferences logindata;
  final formKey = GlobalKey<FormState>();
  bool isLoading = true;
  bool validateAndSave() {
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      setState(() {
        isLoading = true;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context)
        .size
        .height; //fexible height depend on mobile size use in sizebox
    final _width = MediaQuery.of(context)
        .size
        .width; //fexible width depend on mobile size use in sizebox
    return Container(
      color: Colors.redAccent,
      child: SafeArea(
        child: Scaffold(
          body: Form(
            key: formKey,
            child: ListView(
              children: <Widget>[
                //Title Field
                Container(
                  height: _height * 0.07,
                  width: _width * 1.0,
                  margin: EdgeInsets.only(top: 170),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                //Email Field
                Container(
                  height: _height * 0.1,
                  width: _width * 1.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                      ),
                      onChanged: (value) => email = value,
                      validator: (value) =>
                          value.isEmpty ? "Email can't be empty" : null,
                    ),
                  ),
                ),
                //password Filed
                Container(
                  height: _height * 0.1,
                  width: _width * 1.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                      obscureText: true,
                      onChanged: (value) => password = value,
                      validator: (value) =>
                          value.isEmpty ? "Password can't be empty" : null,
                    ),
                  ),
                ),
                //login Button
                Container(
                  height: _height * 0.07,
                  width: _width * 1.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60, right: 60),
                    child: RaisedButton(
                      color: Colors.redAccent,
                      hoverColor: Colors.redAccent[100],
                      elevation: 20.0,
                      onPressed: () async {
                        if (validateAndSave()) {
                          if (email == check_email && password == check_pass) {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('email', email);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext ctx) => myDashboard(
                                  // email: email,
                                ),
                              ),
                            );
                          } else {
                            showDialog<void>(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: SingleChildScrollView(
                                    child: Center(
                                        child: Text(
                                      "Your Password or Email Is Wrong?",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    )),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text(
                                        "Ok",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context, true);
                                        Navigator.pop(context, true);
                                        Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                loginPage(),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        }
                      },
                      child: Text('Login'),
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
Future<http.Response> fetchpost() {
  return http.get('https://www.iroidsolutions.com/interview/test.json');
}

  
  

