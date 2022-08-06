import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/circle.dart';
import 'package:m2m_flutter_main/deneme.dart';
import 'package:m2m_flutter_main/square.dart';
import 'package:table_calendar/table_calendar.dart';
import 'add_task_bar_page.dart';
import 'login_page.dart';
import 'mentee_page.dart';
import 'mentor_page.dart';
import 'splash_screen.dart';
import 'widgets/header_widget.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';

import 'package:m2m_flutter_main/square.dart';
import 'registiration_page.dart';

class MainPage extends StatelessWidget {
  final List _posts = [
    'post 1',
    'post 2 ',
    'post 3',
    'post 4',
  ];
  final List _stories = [
    'fav 1',
    'fav 2 ',
    'fav 3',
    'fav 4',
    'fav 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 236, 251),
      drawer: DrawerHelp(),
      bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        title: Text(
          "Main Page",
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
        //margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notification_add),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          /* CircleAvatar(
            radius: 22,
            backgroundColor: Colors.amber,
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              radius: 20,
              child: Icon(Icons.add, color: Colors.black),
            ),
          ),*/
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(290, 0, 0, 0),
                  child: TextButton(
                    child: Text(
                      'See all',
                      style: TextStyle(
                          color: Color.fromARGB(255, 50, 28, 49),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MentorPage()));
                    },
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 235, 230, 240),
                  height: 200,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    itemBuilder: (context, index) {
                      return Deneme(child: Text("1"));
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(290, 0, 0, 0),
                  child: TextButton(
                    child: Text(
                      'See all',
                      style: TextStyle(
                          color: Color.fromARGB(255, 50, 28, 49),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MentorPage()));
                    },
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 231, 236, 251),
                  height: 200,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ),
                    itemBuilder: (context, index) {
                      return MyCircle(child: Text("1"));
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 40, 240, 0),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                        color: Color.fromARGB(255, 50, 28, 49),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 150,
                  child: GridView.builder(
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return MySquare(child: Text("1"));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
