import 'package:flutter/material.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/pages/video_call_page.dart';
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

    //bottomNavigationBar: BottomAppBar(),

      
   // bottomNavigationBar: BottomAppBar(),
    drawer: DrawerHelp(),
      appBar: AppBar(
          title: Text(
            "CHATS",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            
          ),
          leading: GestureDetector(
    onTap: () {  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          VideoCallPage())); },
    child: Icon(

      Icons.camera_front_outlined,
        // add custom icons also
    ),

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