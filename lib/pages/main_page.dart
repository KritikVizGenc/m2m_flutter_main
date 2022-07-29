import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2m_flutter_main/circle.dart';
import 'package:m2m_flutter_main/square.dart';
import 'login_page.dart';
import 'mentee_page.dart';
import 'mentor_page.dart';
import 'splash_screen.dart';
import 'widgets/header_widget.dart';
import 'package:m2m_flutter_main/common/drawer.dart';
import 'package:m2m_flutter_main/common/Bottom_Bar.dart';

import 'package:m2m_flutter_main/square.dart';
import 'registiration_page.dart';

class MainPage extends StatelessWidget{
final List _posts = ['post 1',
'post 2 ',
'post 3',
'post 4',

];
final List _stories = ['fav 1',
'fav 2 ',
'fav 3',
'fav 4',
'fav 5',

];

   
  @override
  Widget build(BuildContext context) {
    
    
   return Scaffold(
      drawer: DrawerHelp(),
       bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        title: Text("Main Page",
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
        actions: [
          Container(
            margin: EdgeInsets.only( top: 16, right: 16,),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notification_add),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(6),),
                    constraints: BoxConstraints( minWidth: 12, minHeight: 12, ),
                   
                  ),
                )
              ],
              
            ),
          )
        ],
      ),
body: Column(

children :[
Container(
 height: 150,
  child: ListView.builder(
    itemCount: _stories.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context,index){
return MyCircle(
  child: _stories[index],
);
  }),
  
  ),


  Expanded(
    

child: ListView.builder(
  
  itemCount: _posts.length, 
  itemBuilder: (context,index){

  return MySquare(
    child: _posts[index],
  
  );
}),
   
),
],  
    ),
   );
  }

}