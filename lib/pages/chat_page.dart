import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/pages/widgets/category_selector.dart';
import 'package:m2m_flutter_main/pages/widgets/chat_contacts.dart';
import 'package:m2m_flutter_main/pages/widgets/recent_chats.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    bottomNavigationBar: BottomAppBar(),
    drawer: DrawerHelp(),
      appBar: AppBar(
          title: Text(
            "CHATS",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
      ),
      backgroundColor: Color.fromARGB(255, 243, 178, 239) ,
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}