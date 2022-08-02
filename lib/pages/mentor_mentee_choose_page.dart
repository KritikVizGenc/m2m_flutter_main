import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/common/theme_helper.dart';
import 'package:m2m_flutter_main/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/pages/registiration_page.dart';

import 'mentee_page.dart';
import 'mentor_page.dart';

class ChoosePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChoosePageState();
  }
}

class _ChoosePageState extends State<ChoosePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      drawer: DrawerHelp(),
      appBar: AppBar(
        title: Text(
          "Choose Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).colorScheme.secondary,
              ])),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(40, 30, 40, 0),
              child: Icon(
                Icons.email,
                size: 90,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
              child: Text(
                textAlign: TextAlign.center,
                'Your e-mail has been verified.',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              //margin: EdgeInsets.fromLTRB(40, 50, 40, 0),
              child: Text(
                'Select your user type to continue',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 10, 40, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 188, 84, 85),
                  onPrimary: Color.fromARGB(255, 221, 209, 209),
                  shadowColor: Color.fromARGB(255, 7, 7, 6),
                  surfaceTintColor: Color.fromARGB(255, 201, 122, 125),
                  minimumSize: Size(MediaQuery.of(context).size.width * 1,
                      MediaQuery.of(context).size.height * 0.18),
                  //elevation: 3,
                ),
                child: Text(
                  'Mentee',
                  style: TextStyle(fontSize: 40.0),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MenteePage()));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 188, 84, 85),
                  onPrimary: Color.fromARGB(255, 221, 209, 209),
                  shadowColor: Color.fromARGB(255, 7, 7, 6),
                  surfaceTintColor: Color.fromARGB(255, 201, 122, 125),
                  minimumSize: Size(MediaQuery.of(context).size.width * 1,
                      MediaQuery.of(context).size.height * 0.18),
                  //elevation: 3,
                ),
                child: Text(
                  'Mentor',
                  style: TextStyle(fontSize: 40.0),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationPage()));
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
