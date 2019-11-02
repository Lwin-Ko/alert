import 'dart:async';
import 'dart:convert';
import 'ThemeData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'AdminPage.dart';
import 'MemberPage.dart';
import 'model/form_fields_example_form.dart';

void main() => runApp(new MyApp());

String username = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: buildThemeData(),
      debugShowCheckedModeBanner: false,
      title: 'Login Localhost',
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/AdminPage': (BuildContext context) => new AdminPage(
              username: username,
            ),
        '/MemberPage': (BuildContext context) => new FormFieldsExampleForm(
              username: username,
            ),
        '/MyHomePage': (BuildContext context) => new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _login() async {
    final response =
        await http.post("https://unireg.000webhostapp.com//get.php", body: {
      "Name": user.text,
      "NRC": pass.text,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    } else {
      if (datauser[0]['Name'] == 'Zaw') {
        Navigator.pushReplacementNamed(context, '/AdminPage');
      } else if (datauser[0]['Name'] == 'ZawZaw') {
        Navigator.pushReplacementNamed(context, '/MemberPage');
      }

      setState(() {
        username = datauser[0]['Name'];
      });
    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        decoration: new BoxDecoration(color: Colors.white),
//        margin: EdgeInsets.all(30),
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
//
//              new InkWell(
//                  onTap: () {},
//                  child: new Theme(
//                      data: new ThemeData(
//                          primaryColor: Colors.yellow,
//                          primaryColorDark: Colors.red,
//                          hintColor: Colors.yellow
//
//                      ),
//
//                      child: new TextField(
//                        decoration: new InputDecoration(
//
//                            border: new OutlineInputBorder(),
//                            hintText: 'Tell us about yourself',
//                            helperText: 'Keep it short, this is just a demo.',
//                            labelText: 'Life story',
//                            prefixIcon: const Icon(Icons.person, color: Colors.green,),
//                            prefixText: ' ',
//                            suffixText: 'USD',
//                            suffixStyle: const TextStyle(color: Colors.green)),
//                      )
//                  )
//              ),

              new Padding(padding: EdgeInsets.only(top: 30.0)),

              Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('images/uit.gif'),
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 50.0)),

              new TextFormField(
                controller: user,
                decoration: new InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.black)),

                  labelText: "Username",
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  fillColor: Colors.black,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                keyboardType: TextInputType.emailAddress,
                style: new TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),

              Padding(
                padding: EdgeInsets.all(30.0),
//                child: Text('Hello World!'),
              ),

              new TextFormField(
                controller: pass,
                obscureText: true,
                decoration: new InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: "Password",
                  prefixIcon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.green,
                  ),
                  fillColor: Colors.black,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                style: new TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),

              Padding(
                padding: EdgeInsets.all(8.0),
//                child: Text('Hello World!'),
              ),

              RaisedButton(
                child: Text("Login"),

//                color: Colors.transparent,
                textColor: Colors.white,
                color: Colors.red,
//                padding: const EdgeInsets.all(10.0),
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                onPressed: () {
                  _login();
                },
              ),

              Text(
                msg,
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
