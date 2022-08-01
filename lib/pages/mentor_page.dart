import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/pages/registiration_page.dart';
import 'package:m2m_flutter_main/pages/splash_screen.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';
import 'login_page.dart';
import 'mentee_page.dart';
import '../common/Listing.dart';

class MentorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MentorPageState();
  }
}

class _MentorPageState extends State<MentorPage> {
   TextEditingController editingController = TextEditingController();
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
   void filterSearchResults(String query){

//search kısmı dolacak
  }
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerHelp(),
      bottomNavigationBar: BottomBar(),
      body: ListDisplay(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Mentor Page",
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
    );
  }
}
