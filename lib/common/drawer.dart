import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/pages/categories_page.dart';
import 'package:m2m_flutter_main/pages/chat_page.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'package:m2m_flutter_main/pages/categories_page.dart';
import 'package:m2m_flutter_main/pages/main_page.dart';
import 'package:m2m_flutter_main/pages/meeting_pages.dart';
import 'package:m2m_flutter_main/pages/mentor_page.dart';
import 'package:m2m_flutter_main/pages/settings_page.dart';
import 'package:m2m_flutter_main/service/api_service.dart';
import 'package:m2m_flutter_main/service/shared_service.dart';
import '../model/getById_model.dart';
import '../pages/categories_page.dart';
import '../pages/login_page.dart';
import '../pages/mentee_page.dart';
import '../pages/profile_page.dart';
import '../pages/splash_screen.dart';
import '../pages/registiration_page.dart';
import '../main.dart';
import 'package:flutter/services.dart';

class DrawerHelp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DrawerState();
  }
}

class _DrawerState extends State<DrawerHelp> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

  Future<GetByIdModel> futureUser = APIService.getCurrentUser();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).copyWith().primaryColor,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(0),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      SharedService.loginDetails().then((value) =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage(nereyeId: value)))
                      );
                    },
                    child: Container(
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 243, 178, 239),
                        radius: 33,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(
                              'https://productimages.hepsiburada.net/s/40/1500/10650895351858.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        child: TextButton(
                          onPressed: () {
                            SharedService.loginDetails().then((value) =>
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage(nereyeId: value)))
                            );


                          },
                          child: FutureBuilder<GetByIdModel> (
                            future: futureUser,
                            builder: (context, i) {
                              if(i.hasData){
                                if(i.data != null){
                                  return Text(
                                    i.data!.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  );
                                }
                              }
                              return Text(
                                'Connection Problem',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              );


                            },
                          )
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: _drawerIconSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                  fontSize: 17, color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MainPage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.category,
              size: _drawerIconSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Categories',
              style: TextStyle(
                  fontSize: 17, color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoriesPage()));
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.meeting_room,
              size: _drawerIconSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Meetings',
              style: TextStyle(
                  fontSize: 17, color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MeetPages()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people_outline,
                size: _drawerIconSize,
                color: Theme.of(context).colorScheme.secondary),
            title: Text(
              'Mentors',
              style: TextStyle(
                  fontSize: _drawerFontSize,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MentorPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.people_alt,
                size: _drawerIconSize,
                color: Theme.of(context).colorScheme.secondary),
            title: Text(
              'Mentees',
              style: TextStyle(
                  fontSize: _drawerFontSize,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenteePage()),
              );
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: _drawerIconSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                  fontSize: 17, color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SettingPage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.help_center,
              size: _drawerIconSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Chat',
              style: TextStyle(
                  fontSize: 17, color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ChatPage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout_rounded,
              size: _drawerIconSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                  fontSize: _drawerFontSize,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              SharedService.logout(context);
            },
          ),
        ],
      ),
    );
  }
}