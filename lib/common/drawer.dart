import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/pages/main_page.dart';
import 'package:m2m_flutter_main/pages/meeting_pages.dart';
import 'package:m2m_flutter_main/pages/mentor_page.dart';
import 'package:m2m_flutter_main/service/shared_service.dart';
import '../pages/login_page.dart';
import '../pages/mentee_page.dart';
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
                height: 40,
                alignment: Alignment.center,
                
                child: Column(
                  children: [
                    Container(
                      
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 5, color: Colors.white),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            offset: const Offset(5, 5),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.person,
                        size: 45,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    Text(
                      '\nName Surname',
                      style: TextStyle(
                          fontSize: 26,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    /*onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MenteePage()));
                  },*/
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SplashScreen(title: "Splash Screen")));
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MeetPages()));
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
                          SplashScreen(title: "Splash Screen")));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.help_center,
              size: _drawerIconSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Help',
              style: TextStyle(
                  fontSize: 17, color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SplashScreen(title: "Splash Screen")));
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
