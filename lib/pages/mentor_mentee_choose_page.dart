import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/common/theme_helper.dart';
import 'package:m2m_flutter_main/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'mentee_page.dart';
import 'mentor_page.dart';

class ChoosePage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ChoosePageState();
  }
}

class _ChoosePageState extends State<ChoosePage>{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

appBar: AppBar(
        title: Text("Choose Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).colorScheme.secondary,]
              )
          ),
        ),
),

body: Center(
              child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              child: ElevatedButton(
                child: Text(
                  'Mentee',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MenteePage()));
                },
                 
              ),
            ),

 Container(
              margin: EdgeInsets.all(25),
              child: ElevatedButton(
                child: Text(
                  'Mentor',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MentorPage()));
                },
                 
              ),
            ),





              ]
              ),
),

    );
  }
}